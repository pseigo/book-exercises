package sudoku;

import java.util.ArrayList;
import java.util.HashSet;

public class Board2D {
	private int[][] box;
	private int rows, cols;

	public Board2D(int SIZE) {
		this.rows = SIZE;
		this.cols = SIZE;
		this.box = new int[this.rows][this.cols];
	}
	
	private int rand(int min, int max) {
		return (int)(Math.random() * (max - min + 1) + min);
	}
	
	public void fill() {
		int count = 0;
		for (int i = 0; i != rows; ++i) {
			for (int j = 0; j != cols; ++j)
				box[i][j] = ++count;
		}	
	}
	
	public void shuffle() {
		for (int i = 0; i != rows; ++i) {
			for (int j = 0; j != cols; ++j) {
				int rand_row = rand(0, rows - 1),
					rand_col = rand(0, cols - 1);
				
				int swap = box[i][j];
				box[i][j] = box[rand_row][rand_col];
				box[rand_row][rand_col] = swap;
			}
		}
	}
	
	/***
	 * Randomly replaces n elements from the array with 0.
	 * 
	 * @param n Number of elements to randomly remove from the list.
	 */
	public void remove(int n) {
		// out of bounds
		if (n > rows * cols || n < 1)
			throw new IndexOutOfBoundsException("n must not be greater than elements in array or less than 1");
		
		// return if all elements are already removed
		int emptyElements = 0;
		for (int i = 0; i != rows; ++i) {
			for (int j = 0; j != cols; j++) {
				if (box[i][j] == 0)
					emptyElements++;	
			}
		}
		
		if (emptyElements == rows * cols)
			return;
		
		for (int i = 0; i != n; ++i) {
			int rand_row = rand(0, rows - 1),
				rand_col = rand(0, cols - 1);
			
			// retry if removing an element which is already null
			if (box[rand_row][rand_col] == 0)
				--i;
			else
				box[rand_row][rand_col] = 0;
		}
	}
	
	public void print() {
		for (int i = 0; i != rows; ++i) {
			for (int j = 0; j != cols; ++j) {
				System.out.print(box[i][j] + " ");
			}
			System.out.println();
		}
	}

	public ArrayList<Integer> getMissingNumbers() {
		ArrayList<Integer> missing = new ArrayList<Integer>();
		HashSet<Integer> set = new HashSet<Integer>();

		// add found numbers to  set
		for (int i = 0; i != rows; ++i) {
			for (int j = 0; j != cols; ++j) {
				// only add non-zero elements
				if (box[i][j] != 0)
					set.add(box[i][j]);
			}
		}
		
		for (int i = 0; i != 9; ++i) {
			int num = i + 1;
			if (!set.contains(num))
				missing.add(num);
		}
		
		return missing;
	}
	
}
