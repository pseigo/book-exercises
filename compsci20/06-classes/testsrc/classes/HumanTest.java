package classes;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class HumanTest {

	private Human classUnderTest;
	
	@Before
	public void setUp() throws Exception {
		classUnderTest = new Human("Billy", "Male", 34);
	}

	@Test
	public void testAddIntInt() {
		int a = -2, b = 3, result = a + b;
		assertEquals(result, classUnderTest.add(a, b));
		
		a = 23;
		b = 45;
		result = a + b;
		assertEquals(result, classUnderTest.add(a, b));
		
		a = -345;
		b = 0;
		result = a + b;
		assertEquals(result, classUnderTest.add(a, b));
	}

	@Test
	public void testAddStringString() {
		int result = 0 + 1;
		assertEquals(result, classUnderTest.add("zero", "one"));
		
		result = 2 + 9;
		assertEquals(result, classUnderTest.add("two", "nine"));
		
		result = 3 + 8;
		assertEquals(result, classUnderTest.add("three", "eight"));
		
		result = 4 + 7;
		assertEquals(result, classUnderTest.add("four", "seven"));
		
		result = 5 + 6;
		assertEquals(result, classUnderTest.add("five", "six"));
		
		result = 0;
		assertEquals(result, classUnderTest.add("zero", "zero"));
		
		result = 9 + 9;
		assertEquals(result, classUnderTest.add("nine", "nine"));
		
		// 10 is not defined as a number
		result = -1;
		assertEquals(result, classUnderTest.add("eight", "ten"));
	}

}
