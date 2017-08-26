package boxsum;

public class Main {

	public static void main(String[] args) {
		int rows = 20, cols = 20;
		int[][] arr = new int[rows][cols];
		Printer printer = new Printer();
		
		fill(arr, rows, cols);
		printer.print(arr, rows, cols);
		System.out.println(largestSum(arr, rows, cols, 3));
	}
	
	public static void fill(int[][] arr, int rows, int cols) {
		int count = 1;
		for (int row = 0; row != rows; ++row) {
			for (int col = 0; col != cols; ++col)
				arr[row][col] = count++;
		}
	}
	
	public static int largestSum(int[][] arr, int rows, int cols, int range) {
		int sum = 0, max = 0;
		
		for (int row = 0; row != rows - range + 1; ++row) {
			for (int col = 0; col != cols - range + 1; ++col) {
				
				// add each element in range*range selection
				for (int i = row; i != row + range; ++i) {
					for (int j = col; j != col + range; ++j)
						sum += arr[i][j];
				}
				
				// only keep largest sum
				max = Math.max(max, sum);
				sum = 0;
			}
		}
		
		return max;
	}

}
