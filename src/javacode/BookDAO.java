package javacode;

import java.io.*;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    public static List<Book> getBooks(String sql) {
        List<Book> list = new ArrayList();
        ResultSet rs = MyDBConnection.executeQuery(sql);
        try {
            while(rs.next()){
                String bookID = rs.getString("bookID");
                InputStream cover = rs.getBinaryStream("cover");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String ISBN = rs.getString("ISBN");
                String description = rs.getString("description");

                Book book;
                if (cover != null) {
                    String path = BookDAO.getPathfromSavedCover(cover, title);
                    book = new Book(bookID, path, title, author, ISBN, description);
                } else {
                    book = new Book(bookID, null, title, author, ISBN, description);
                }
                list.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Book getBookByID(String ID) {
        String sql = "select * from library.book where bookID = '"+ ID + "'";
        return getBooks(sql).get(0);
    }

    public static List<Book> getBooksByTitle(String title) {
        String sql = "select * from library.book where title like '%" + title + "%'";
        return getBooks(sql);
    }

    private static String getPathfromSavedCover(InputStream cover, String title) throws IOException {
        byte[] b = new byte[cover.available()];
        String coverPath = URLDecoder.decode(new BookDAO().getClass().getResource("../../../").getPath(), "UTF-8");
        coverPath += "resources/books/" + title + ".jpg";

        cover.read(b);
        OutputStream out;
        out = new FileOutputStream(coverPath);
        out.write(b);
        out.flush();
        out.close();

        return coverPath;
    }
}
