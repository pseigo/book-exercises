package ooointro;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Human chow = new Human("Chow", 21, true);
		
		chow.add("one", "four");
		chow.printName();
		
		birthday(chow);
		
		chow.printAge();
		chow.printGender();
	}
	
	public static void checkName(Human human) {
		human.printName();
	}
	
	public static void birthday(Human human) {
		human.setAge(human.age() + 1);
	}

}
