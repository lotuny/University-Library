package javacode;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReaderDAO {
    
    public static List<Reader> getReaders(String sql) {
        List<Reader> list = new ArrayList();
        ResultSet rs = MyDBConnection.executeQuery(sql);
        try {
            while(rs.next()){
                String readerID = rs.getString("readerID");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String gender = rs.getString("gender");
                String tel = rs.getString("tel");
                String role = rs.getString("role");
                int maxnum = rs.getInt("maxnum");

                Reader reader = new Reader(readerID, name, age, gender, tel, role, maxnum);
                list.add(reader);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Reader getReaderByID(String ID) {
        String sql = "select * from library.reader where readerID = '" + ID + "'";
        return getReaders(sql).get(0);
    }
}
