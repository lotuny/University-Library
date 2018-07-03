package javacode;

public class Reader {

	private String readerID;
	private String name;
	private int age;
	private String gender;
	private String tel;
	private String role;
    private int maxnum;

    public Reader(String readerID, String name, int age, String gender, String tel, String role, int maxnum) {
        this.name = name;
        this.readerID = readerID;
        this.age = age;
        this.gender = gender;
        this.tel = tel;
        this.role = role;
        this.maxnum = maxnum;
    }

    public String getId() {
        return readerID;
    }

	public String getName() {
		return name;
	}

	public int getAge() {
		return age;
	}

	public String getGender() {
		return gender;
	}

	public int getMaxnum() {
		return maxnum;
	}

	public String getTel() {
		return tel;
	}

    public String getRole() {
        return role;
    }
}
