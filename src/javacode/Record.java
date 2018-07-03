package javacode;

import java.sql.Date;

public class Record {

    private String bookID;
    private String title;
    private String readerID;
    private String name;
    private Date begin;
    private Date deadline;
    private int fine;

    public Record(String bookID, String readerID, Date begin, Date deadline, int fine) {
        this.bookID = bookID;
        title = BookDAO.getBookByID(bookID).getTitle();
        this.readerID = readerID;
        name = ReaderDAO.getReaderByID(readerID).getName();
        this.begin = begin;
        this.deadline = deadline;
        this.fine = fine;
    }

    public Record(String bookID, String title, String readerID, String name, Date begin, Date deadline, int fine) {
        this.bookID = bookID;
        this.title = title;
        this.readerID = readerID;
        this.name = name;
        this.begin = begin;
        this.deadline = deadline;
        this.fine = fine;
    }

    public String getBookID() {
        return bookID;
    }

    public String getTitle() {
        return title;
    }

    public String getReaderID() {
        return readerID;
    }

    public String getName() {
        return name;
    }

    public Date getBegin() {
        return begin;
    }

    public Date getDeadline() {
        return deadline;
    }

    public int getFine() {
        return fine;
    }
}
