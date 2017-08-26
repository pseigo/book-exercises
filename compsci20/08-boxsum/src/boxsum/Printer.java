package boxsum;

public class Printer {
	
	private int lengthOf(int n) {
		if (Math.abs(n) < 10)
			return 1;
		return lengthOf(n / 10) + 1;
	}
	
	private int maxLengthOf(int[][] arr, int rows, int cols) {
		int max = 0;
		for (int row = 0; row != rows; ++row) {
			for (int col = 0; col != cols; ++col)
				max = Math.max(max, lengthOf(arr[row][col]));
		}
		return max;
	}
	
	public void print(int[][] arr, int rows, int cols) {
		int maxLength = maxLengthOf(arr, rows, cols),
			padding = 1;
		
		for (int row = 0; row != rows; ++row) {
			for (int col = 0; col != cols; ++col) {
				// print element
				System.out.print(arr[row][col]);
				
				// print spaces
				int currentLength = lengthOf(arr[row][col]);
				for (int i = 0; i != (maxLength - currentLength + padding); ++i)
					System.out.print(" ");
			}
			
			System.out.println();
		}
	}
	
}
