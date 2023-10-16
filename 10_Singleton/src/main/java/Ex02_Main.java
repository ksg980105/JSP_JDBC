
public class Ex02_Main {
	public static void main(String[] args) {
		//Ex02_Fruit f1 = new Ex02_Fruit();
		
		Ex02_Fruit obj = Ex02_Fruit.getInstance();
		Ex02_Fruit obj1 = Ex02_Fruit.getInstance();
		System.out.println(obj);
		System.out.println(obj1);
		obj.apple();
		obj1.banana();
	}
}
