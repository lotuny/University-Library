package javacode.Database;

public class TableBuilder {

    public TableBuilder() {
        MyDBConnection.init();
    }

    public boolean buildLibrary() {
        String sql = "create database if not exists library";

        return  (MyDBConnection.executeUpdate(sql) && buildReader() && buildAccount() && buildBook() && buildRecord());
    }

    private boolean buildBook() {
        String sql = "create table if not exists library.book(\n"
                   + "bookID varchar(10) not null primary key,\n"
                   + "cover blob,\n"
                   + "title varchar(50) not null,\n"
                   + "author varchar(20) not null,\n"
                   + "state varchar(10) not null,\n"
                   + "ISBN varchar(13) not null,\n"
                   + "description longtext)";
        return  (MyDBConnection.executeUpdate(sql));
    }

    private boolean buildReader() {
        String sql = "create table  if not exists library.reader (\n"
                   + "readerID varchar(10) not null primary key,\n"
                   + "name varchar(20) not null,\n"
                   + "age int not null,\n"
                   + "gender varchar(10) not null,\n"
                   + "tel varchar(20) not null,\n"
                   + "role varchar(10) not null,\n"
                   + "maxnum int not null)";
        return  (MyDBConnection.executeUpdate(sql));
    }

    private boolean buildAccount() {
        String sql1 = "create table if not exists library.reader_account (\n"
                    + "id varchar(10) not null primary key,\n"
                    + "password varchar(20) not null)";

        String sql2 = "create table  if not exists library.ad_account (\n"
                + "id varchar(10) not null primary key,\n"
                + "password varchar(20) not null)";
        return  (MyDBConnection.executeUpdate(sql1) && MyDBConnection.executeUpdate(sql2));
    }

    private boolean buildRecord() {
        String sql = "create table  if not exists library.record (\n"
                + "bookID varchar(10) not null primary key,\n"
                + "title varchar(50) not null,\n"
                + "readerID varchar(10) not null,\n"
                + "name varchar(20) not null,\n"
                + "begin date not null,\n"
                + "deadline date not null,\n"
                + "fine int not null)";
        return  (MyDBConnection.executeUpdate(sql));
    }

}
