package javacode;

import javax.swing.text.html.StyleSheet;
import java.sql.*;

public class MyDBConnection {

    private static Connection myConnection;

    public static void init(){
       try{
        Class.forName("com.mysql.jdbc.Driver");
        myConnection=DriverManager.getConnection(
                "jdbc:mysql://localhost","root", "123456"
                );
        }
        catch(Exception e){
            System.out.println("Failed to get connection");
            e.printStackTrace();
        }
    }
    
    public static Connection getMyConnection(){
        return myConnection;
    }
    
    public static void close(ResultSet rs){
        
        if(rs !=null){
            try{
               rs.close();
            }
            catch(Exception e){}
        
        }
    }
    
    public static void close(Statement stmt){
        
        if(stmt !=null){
            try{
               stmt.close();
            }
            catch(Exception e){}
        
        }
    }
     
    public static void destroy(){

        if(myConnection !=null){
            try{
               myConnection.close();
            } catch(Exception e){}


        }
    }

    public static boolean executeUpdate(String sql) {
        try {
            if( getMyConnection() == null)
                MyDBConnection.init();
            myConnection.createStatement().executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static ResultSet executeQuery(String sql) {
        try {
            if( getMyConnection() == null)
                MyDBConnection.init();
            return getMyConnection().createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE).executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}