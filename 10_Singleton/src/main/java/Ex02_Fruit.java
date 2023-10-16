
public class Ex02_Fruit {
	private String name;
	private int price;
	
	private static Ex02_Fruit instance;
	
	public static Ex02_Fruit getInstance() {	//클래스이름으로 메서드 호출을 위해 static변수 사용
		if(instance == null) {					//static 메서드 안에서는 static변수만 사용가능
			instance = new Ex02_Fruit();
		}
		return instance; //주소 리턴
	}
	
	private Ex02_Fruit() {
		System.out.println("Ex02_Fruit 생성자");
	}
	
	public void apple() {
		System.out.println("apple");
	}
	
	public void banana() {
		System.out.println("banana");
	}
}
