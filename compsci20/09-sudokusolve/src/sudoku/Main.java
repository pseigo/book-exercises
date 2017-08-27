package sudoku;

import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		// list();
		box();
	}
	
	public static void box() {
		final int BOX_SIZE = 3;
		Board2D box = new Board2D(BOX_SIZE);
		
		box.fill();
		box.shuffle();
		box.remove(4);
		box.print();
		System.out.println();
		
		ArrayList<Integer> missing = box.getMissingNumbers();
		for (int i = 0; i != missing.size(); ++i) {
			System.out.println(missing.get(i));
		}
	}
	
	public static void list() {
		final int LIST_SIZE = 9;
		int[] list = new int[LIST_SIZE];
		
		Board1D.fill(list);
		Board1D.shuffle(list);
		Board1D.remove(list, 2);
		Board1D.print(list);
		System.out.println("\n");
		
		ArrayList<Integer> missing = Board1D.getMissingNumbers(list);
		for (int i = 0; i != missing.size(); ++i) {
			System.out.println(missing.get(i));
		}
	}
	
}
