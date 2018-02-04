package binarysearch;

public class Main {

	public static void main(String[] args) {
		int[] arr = {1, 2, 3, 4, 5, 6, 14, 15, 34, 54, 94};
		
		System.out.println(search(arr, 34));
	}
	
	// TODO implement recursively with tail call optimization
	public static boolean search(int[] arr, int find, int left, int right) {
		while (left <= right) {
			final int mid = left + (right - left) / 2;
			
			if (arr[mid] == find)
				return true;
			else if (find < arr[mid])
				right = mid - 1;
			else
				left = mid + 1;
		}
		
		return false;
	}
	
	public static boolean search(int[] arr, int find) {
		return search(arr, find, 0, arr.length - 1); 
	}

}
