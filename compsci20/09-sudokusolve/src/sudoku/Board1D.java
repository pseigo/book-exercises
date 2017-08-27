package sudoku;

import java.util.ArrayList;

public class Board1D {
	public static void fill(int[] arr) {
		for (int i = 0; i != arr.length; ++i)
			arr[i] = i + 1;
	}
	
	public static void shuffle(int[] arr) {
		for (int i = 0; i != arr.length; ++i) {
			int rand = (int)(Math.random() * arr.length);
			
			int swap = arr[i];
			arr[i] = arr[rand];
			arr[rand] = swap;
		}
	}
	
	/***
	 * Randomly replaces n elements from the array with 0.
	 * 
	 * @param arr
	 * @param n Number of elements to randomly remove from the list.
	 */
	public static void remove(int[] arr, int n) {
		// out of bounds
		if (n > arr.length || n < 1)
			throw new IndexOutOfBoundsException("n must not be greater than arr.length or less than 1");
		
		// return if all elements are already removed
		int emptyElements = 0;
		for (int i = 0; i != arr.length; ++i) {
			if (arr[i] == 0)
				emptyElements++;
		}
		
		if (emptyElements == arr.length)
			return;
		
		for (int i = 0; i != n; ++i) {
			int rand = (int)(Math.random() * arr.length);
			
			// retry if removing an element which is already null
			if (arr[rand] == 0)
				--i;
			else
				arr[rand] = 0;
		}
	}
	
	public static void print(int[] arr) {
		for (int i = 0; i != arr.length; ++i)
			System.out.print(arr[i] + " ");
	}
	
	public static ArrayList<Integer> getMissingNumbers(int[] arr) {
		final int ARR_SIZE = arr.length;
		boolean[] nonZero = new boolean[ARR_SIZE];
		
		// flag non-zero elements as true
		for (int i = 0; i != ARR_SIZE; ++i) {
			if (arr[i] != 0)
				nonZero[arr[i] - 1] = true;
		}
		
		// add position of zero elements to  missing
		ArrayList<Integer> missing = new ArrayList<Integer>();
		for (int i = 0; i != ARR_SIZE; ++i) {
			if (!nonZero[i])
				missing.add(i + 1);
		}
			
		return missing;
	}
}
