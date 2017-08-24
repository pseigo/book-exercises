package classes;

/**
 * Computer Science 20: assignment 6, classes.
 * @author Peyton Seigo
 *
 */

public class Main {
	public static void main(String[] args) {
		Human Skywalker = new Human("Anakin", "male", 19);
		Human Amidala = new Human("Padmé", "female", 24);
		checkName(Amidala);		// prints Padmé (including the accented character!)
		
		Skywalker.printAge(); 	// prints 19
		System.out.println(); 	// newline
		
		birthday(Skywalker);	// add 1 to age
		Skywalker.printAge(); 	// prints 20
	}
	
	public static void checkName(Human human) {
		System.out.println(human.getName());
	}
	
	// references to the objects members are passed by value,
	// therefore we are able to modify them as we know their location.
	public static void birthday(Human human) {
		human.setAge(human.getAge() + 1);
	}
}
