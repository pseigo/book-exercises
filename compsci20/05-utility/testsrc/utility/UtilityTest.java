package utility;

import static org.junit.Assert.*;

//import org.junit.Before;
import org.junit.Test;

public class UtilityTest {

//	private Utility classUnderTest;
//	
//	@Before
//	public void setUp() throws Exception {
//		classUnderTest = new Utility();
//	}
	
	@Test
	public void testRand() {
		// common case
		int min = 0,
			max = 3,
			result = Utility.rand(min, max);
		assertTrue(result >= min && result <= max);
		
		// negative domain
		min = -3;
		max = 2;
		result = Utility.rand(min, max);
		assertTrue(result >= min && result <= max);
		
		// swap min and max arguments
		min = 0;
		max = 5;
		result = Utility.rand(max, min);
		assertTrue(result >= min && result <= max);
	}

	@Test
	public void testDigitAt() {
		int result = 4;
		assertEquals(result, Utility.digitAt(5245, 3));
		
		result = 2;
		assertEquals(result, Utility.digitAt(-423, 2));
		
		result = 0;
		assertEquals(result, Utility.digitAt(0, 1));
	}

}
