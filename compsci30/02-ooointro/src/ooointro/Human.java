package ooointro;

public class Human {
	private String name;
	private int age;
	private boolean male;
	
	public Human(String name, int age, boolean male) {
		this.name = name;
		this.age = age;
		this.male = male;
	}
	
	public Human() {
		age = 0;
		male = true;
	}
	
	public void say(String message) {
		System.out.println(name + " says: " + message);
	}

	public void printName() {
		say("my name is " + name);
	}
	
	public void printAge() {
		say("I am " + age() + " years old");
	}
	
	public void printGender() {
		say("I am a " + (male ? "male" : "female"));
	}
	
	public int age() {
		if (age > 30)
			return (Math.random() <= 0.3) ? age - 5 : age;
		return age;
	}
	
	public void setAge(int age) { 
		if (age > 0)
			this.age = age;
	}
	
	public int toInt(String str) {
		String[] words = {
			"zero", "one", "two", "three", "four",
			"five", "six", "seven", "eight", "nine"};
			
		for (int i = 0; i != words.length; ++i)
			if (words[i].equals(str))
				return i;
		
		return 0;
	}
	
	public void add(int a, int b) {
		say("the sum is " + (a + b));
	}
	
	public void add(String a, String b) {
		add(toInt(a), toInt(b)); 
	}
}
