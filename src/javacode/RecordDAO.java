package javacode;

import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecordDAO {
    public static List<Record> getRecords(String sql) {
        List<Record> list = new ArrayList();
        ResultSet rs = MyDBConnection.executeQuery(sql);
        try {
            while(rs.next()){
                String bookID = rs.getString("bookID");
                String title = rs.getString("title");
                String readerID = rs.getString("readerID");
                String name = rs.getString("name");
                Date begin = rs.getDate("begin");
                Date deadline = rs.getDate("deadline");
                int fine = rs.getInt("fine");

                Record reader = new Record(bookID, title, readerID, name, begin, deadline, fine);
                list.add(reader);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Record> getRecordsByReaderID (String readerID) {
        String sql = "select * from library.record where readerID = '" + readerID + "'";
        return getRecords(sql);
    }
}
