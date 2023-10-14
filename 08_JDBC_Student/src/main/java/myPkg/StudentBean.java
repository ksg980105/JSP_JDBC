package myPkg;

public class StudentBean {
	private int num;
	private String id;
	private String passwd;
	private String name;
	private int year;
	private int month;
	private int day;
	private String hobby;
	private int c;
	private int java;
	private int jsp;
	private int sum;
	
public StudentBean() {
		
	}
	public StudentBean(int num, String id, String passwd, String name, int year, int month, int day, String hobby,
			int c, int java, int jsp, int sum) {
		super();
		this.num = num;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
		this.year = year;
		this.month = month;
		this.day = day;
		this.hobby = hobby;
		this.c = c;
		this.java = java;
		this.jsp = jsp;
		this.sum = sum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	public int getJava() {
		return java;
	}
	public void setJava(int java) {
		this.java = java;
	}
	public int getJsp() {
		return jsp;
	}
	public void setJsp(int jsp) {
		this.jsp = jsp;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
}
