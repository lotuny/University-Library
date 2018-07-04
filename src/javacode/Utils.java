package javacode;

import java.io.*;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class Utils {

	private static Calendar calendar = Calendar.getInstance();

	public static boolean INCREASE = true;
	public static boolean DECREASE = false;

    //check whether a reader can borrow more books
	public static boolean checkMaxnum(String readerID){
		try{
			String sql = "select maxnum from library.reader where readerID = '" + readerID + "'";
			ResultSet rs = MyDBConnection.executeQuery(sql);
			if (rs.next()){
				return (rs.getInt("maxnum") > 0);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	//check reader's password
	public static boolean readerCheck(String id, String password) {
		String sql = "select password from library.reader_account where id = '" + id + "'";
	    ResultSet rs = MyDBConnection.executeQuery(sql);

        return checkPassword(rs, password);
	}
	//check administrator's password
	public static boolean adCheck(String id, String password){
        String sql = "select password from library.ad_account where id = '" + id + "'";
        ResultSet rs = MyDBConnection.executeQuery(sql);

        return checkPassword(rs, password);
	}
    //sub-method for check password
	private static boolean checkPassword(ResultSet rs, String password) {
	    boolean isCorrect = false;
        try {
            while(rs.next()){
                if (password.equals(rs.getString("password"))) isCorrect = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isCorrect;
    }
	//reader borrows a book
	public static int borrowBook(String bookID, String readerID, Date begin){
		try {
		    if (!isBookOnShelf(bookID)) return 1; //Error 1: book was lent
            if (!checkMaxnum(readerID)) return 2; //Error 2: number of books was counted down to 0
		    String sql = "select role from library.reader where readerID = '" + readerID + "'";
		    ResultSet rs = MyDBConnection.executeQuery(sql);
		    if (rs.next()) {
                String role = rs.getString("role");
                calendar.setTime(begin);
                int duration;
                if (role.equals("student")) {
                    duration = 40;
                } else if (role.equals("staff")) {
                    duration = 60;
                } else {
                    duration = 0;
                }
                calendar.add(Calendar.DATE, duration);

                Book book = BookDAO.getBookByID(bookID);
                Reader reader = ReaderDAO.getReaderByID(readerID);
                //produce record
                sql = "insert into library.record values('"
                        + bookID + "','" + book.getTitle() + "','" + readerID+ "','" + reader.getName() + "','" + begin + "','" + new Date(calendar.getTime().getTime()) + "','" + 0 + "')";
                MyDBConnection.executeUpdate(sql);
                //update state of book
                sql = "update library.book set state = 'lent' where bookID = '" + bookID + "'";
                MyDBConnection.executeUpdate(sql);
                //update reader's maxnum
                sql = "update library.reader set maxnum = maxnum - '1' where readerID = '" + readerID + "'";
                MyDBConnection.executeUpdate(sql);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0; //Succeed.
	}
	//check whether a book can be lent
	private static boolean isBookOnShelf(String bookID) {
        try {
            String sql = "select state from library.book where bookID = '" + bookID + "'";
            ResultSet rs = MyDBConnection.executeQuery(sql);
            if (rs.next()) {
                return (rs.getString("state").equals("on shelf"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    //reader renews a book
    public static boolean renew(String bookID){
	    boolean isDone = false;
        try {
            String sql = "select deadline from library.record where bookID = '" + bookID + "'";
            ResultSet rs = MyDBConnection.executeQuery(sql);
            if (rs.next()) {
                Date deadline = rs.getDate("deadline");
                calendar.setTime(deadline);
                calendar.add(Calendar.DATE, 30);

                sql = "update library.record set deadline = '" + new Date(calendar.getTime().getTime()) + "'" + " where bookID = '" + bookID + "'";
                MyDBConnection.executeUpdate(sql);

                sql = "update library.book set state = 'renewed'  where bookID = '" + bookID + "'";
                MyDBConnection.executeUpdate(sql);
            }
            isDone = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isDone;
    }
    //reader returns a book
    public static boolean returnBook(String bookID){
        boolean isDone = false;
        try {
            String sql = "select readerID from library.record where bookID = '" + bookID + "'";
            ResultSet rs = MyDBConnection.executeQuery(sql);
            if (rs.next()) {
                String readerID = rs.getString("readerID");
                sql = "delete from library.record where bookID = '" + bookID + "'";
                MyDBConnection.executeUpdate(sql);
                sql = "update book set state = 'on shelf' where bookID = '" + bookID + "'";
                MyDBConnection.executeUpdate(sql);
                sql = "update reader set maxnum = maxnum + '1' where readerID = '" + readerID + "'";
                MyDBConnection.executeUpdate(sql);
                isDone = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return isDone;
        }
    }
    //administrator adds a book
	public static boolean addBook(String bookID, String coverPath, String title, String author, String ISBN, String description) {
		try {
		    if (MyDBConnection.getMyConnection() == null)
		        MyDBConnection.init();

            String sql = "insert into library.book (bookID,cover,title,author,state,ISBN) values(?,?,?,?,?,?,?)";
            PreparedStatement prest = MyDBConnection.getMyConnection().prepareStatement(sql);

            prest.setString(1, bookID);

            File file = new File(coverPath);
            FileInputStream fis = new FileInputStream(file);
            prest.setBinaryStream(2, fis, file.length());

            prest.setString(3, title);
            prest.setString(4, author);
            prest.setString(5, "on shelf");
            prest.setString(6, ISBN);
            prest.setString(7, description);

            prest.execute();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//administrator adds a reader
	public static boolean addReader(String readerID, String name, int age, String gender, String tel, String role){
		try {
		    int maxnum;

            if (role.equals("student")) {
                maxnum = 15;
            } else if (role.equals("staff")) {
                maxnum = 30;
            } else {
                maxnum = 3;
            }

			String sql = "insert into reader values('"
                    + readerID + "','" + name + "','" + age + "','" + gender + "','" + tel + "','" + role + "','" + maxnum + "')";
		    MyDBConnection.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
    //administrator deletes a reader
	public static boolean deleteReader(String readerID){
		try {
			String sql= "delete from library.reader where readerID = '" + readerID + "'";
			MyDBConnection.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//query reader's books
	public static List<Book> getMyBooks(String readerID){
		String sql = "select * from library.record inner join book on record.bookID = book.bookID where readerID = '"+ readerID + "'";
        return BookDAO.getBooks(sql);
	}

	public static List<Book> getAllBooks() {
	    String sql = "select * from library.book";
	    return BookDAO.getBooks(sql);
    }

    public static List<Reader> getAllReaders() {
        String sql = "select * from library.reader";
        return ReaderDAO.getReaders(sql);
    }
}
