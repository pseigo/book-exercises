package classes;

import java.util.HashMap;
import java.util.Map;

public class Human {
	private String _name;
	private String _gender;
	private int _age;
	
	public Human() {
		_name = "n/a";
		_gender = "n/a";
		_age = 0;
	}
	
	public Human(String name, String gender, int age) {
		_name = name;
		_gender = gender;
		_age = age;
	}
	
	public Human(String name) {
		_name = name;
		_gender = "n/a";
		_age = 0;
	}
	
	public Human(String gender, int age) {
		_name = "n/a";
		_gender = gender;
		_age = age;
	}
	
	// Accessor/getter mutator methods
	public String getName() {
		return _name;
	}
	
	public String getGender() {
		return _gender;
	}
	
	public int getAge() {
		if (_age > 30) {
			double rand = Math.random() * 100;
			if (rand >= 70)
				return (_age - 5);
		}
		
		return _age;
	}
	
	// Modifier/setter mutator methods
	public void setName(String name) {
		_name = name;
	}
	
	public void setGender(String gender) {
		_gender = gender;
	}
	
	public void setAge(int age) {
		_age = age;
	}
	
	// Printer methods
	public void printName() {
		System.out.print(_name);
	}
	
	public void printGender() {
		System.out.print(_gender);
	}
	
	public void printAge() {
		System.out.print(_age);
	}
	
	//  Other methods
	public int add(int x, int y) {
		int sum = x + y;
		System.out.println(_name + " says: the sum is " + sum + ".");
		return sum;
	}
	
	public int add(String x, String y) {
		Map<String, Integer> numbers = new HashMap<String, Integer>();
		numbers.put("zero", 0);
		numbers.put("one", 1);
		numbers.put("two", 2);
		numbers.put("three", 3);
		numbers.put("four", 4);
		numbers.put("five", 5);
		numbers.put("six", 6);
		numbers.put("seven", 7);
		numbers.put("eight", 8);
		numbers.put("nine", 9);
		
		x = x.toLowerCase();
		y = y.toLowerCase();
		
		try {
			return numbers.get(x) + numbers.get(y);
		} catch (NullPointerException e) {
			System.out.println("Error: unable to add, string not recognized as a number");
		}
		
		return -1;
	}
	
}
