package javacode;

public class Book {

    private String bookID;
    private String coverPath;
    private String title;
	private String author;
	private String state = "lent";
	private String ISBN;
	private String description;

    public Book(String bookID, String coverPath, String title, String author, String state, String ISBN, String description) {
        this.bookID = bookID;
        this.coverPath = coverPath;
        this.title = title;
        this.author = author;
        this.state = state;
        this.ISBN = ISBN;
        this.description = description;
    }

	public Book(String bookID, String coverPath, String title, String author, String ISBN, String description) {
	    this.bookID = bookID;
        this.coverPath = coverPath;
	    this.title = title;
	    this.author = author;
	    this.ISBN = ISBN;
	    this.description = description;
    }

    public String getCoverPath() {
        return coverPath;
    }

    public String getBookID() {
	    return bookID;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthor() {
        return author;
    }

	public String getState() {
		return state;
	}

	public String getISBN() {
		return ISBN;
	}

    public String getDescription() {
        return description;
    }

    public String toString() {
        return "" + bookID + " " + coverPath + " " +title + " " + author + " " + state + " " + ISBN;
    }

    public String mybook2String() {
        return "" + bookID + " " + title + " " + author + " " + ISBN;
    }
}
