package arrays;

public class ArraysAssignment {
	private static int rand(int min, int max) {
        // swap
        if (min > max) {
            int temp = min;
            min = max;
            max = temp;
        }

        return (int)(Math.random() * (max - min + 1) + min);
	}
	
	private static boolean isEmpty(int[] arr) {
		return arr.length < 1 ? true : false;
	}
	
	private static int lengthOf(int n) {
		if (Math.abs(n) < 10)
			return 1;
		return lengthOf(n / 10) + 1;
	}
	
	private static int maxLengthOf(int[] arr) {
		int max = 0;
		for (int i = 0; i != arr.length; ++i)
			max = Math.max(max, lengthOf(arr[i]));
		return max;
	}
	
	private static int sumOfSubset(int[] arr, int begin, int end) {
		int sum = 0;
		for (int i = begin; i != end + 1; ++i)
			sum += arr[i];
		return sum;
	}
	
	// =========================== Part 1 ===========================
	public static void fillRandom(int[] arr, int min, int max) {
		for (int i = 0; i != arr.length; ++i) {
			arr[i] = rand(min, max);
		}
	}
	
	public static void fillSequential(int[] arr, int start) {
		for (int i = 0; i != arr.length; ++i) {
			arr[i] = start + i;
		}
	}
	
	public static void print(int[] arr) {
		int size = arr.length,
			maxLength = maxLengthOf(arr),
			padding = 1;
		
		// print each element
		for (int i = 0; i != size; ++i) {
			System.out.print(arr[i]);
			
			// print spaces
			int currentLength = lengthOf(arr[i]);
			for (int j = 0; j != (maxLength - currentLength + padding); ++j)
				System.out.print(" ");
			
			// newline every 10th element
			if ((i + 1) % 10 == 0)
				System.out.println();
		}
	}
	
	public static void shuffle(int[] arr) {
		for (int i = 0; i != arr.length; ++i) {
			int index = rand(0, arr.length - 1);
			int swap = arr[i];
			arr[i] = arr[index];
			arr[index] = swap;
		}
	}
	
	// =========================== Part 2 ===========================
	// Returns first occurrence of element in array
	public static int find(int[] arr, int n) {
		for (int i = 0; i != arr.length; ++i) {
			if (arr[i] == n)
				return i;
		}
		
		return -1;
	}
	
	public static boolean isNonDecreasing(int[] arr) {
		if (isEmpty(arr))
			return true;
		// TODO throw an exception or return true if empty?
		// throw new ArrayIndexOutOfBoundsException("array has no elements to check if in non-decreasing order");
			
		for (int i = 0; i != arr.length - 1; ++i) {
			if (arr[i + 1] < arr[i])
				return false;
		}
		
		return true;
	}
	
	public static void bogosort(int arr[], int maxAttempts) {
		// already sorted
		if (isNonDecreasing(arr))
			return;
		
		// sort
		for (int i = 0; i != maxAttempts; ++i) {
			shuffle(arr);
			if (isNonDecreasing(arr))
				return;
		}
		
		// was not able to sort before reaching maxAttempts
		return;
	}
	
	// =========================== Part 3 ===========================
	public static int getSmallestElement(int arr[]) {
		if (isEmpty(arr))
			throw new ArrayIndexOutOfBoundsException("array has no elements to find smallest element");
		
		int min = arr[0];
		for (int i = 0; i != arr.length; ++i) {
			min = Math.min(min, arr[i]);
		}
		
		return min;
	}
	
	public static int getLargestElement(int arr[]) {
		if (isEmpty(arr))
			throw new ArrayIndexOutOfBoundsException("array has no elements to find largest element");
		
		int max = arr[0];
		for (int i = 0; i != arr.length; ++i) {
			max = Math.max(max, arr[i]);
		}
		
		return max;
	}
	
	// Returns number of occurrences of element in array
	public static int findOccurrences(int[] arr, int n) {
		int count = 0;
		for (int i = 0; i != arr.length; ++i) {
			if (arr[i] == n)
				++count;
		}
		
		return count;
	}
	
	public static void replace(int[] arr, int find, int replace) {
		for (int i = 0; i != arr.length; ++i) {
			if (arr[i] == find)
				arr[i] = replace;
		}
	}
	
	// TODO rename method to something more descriptive
	/**
	 * Finds the greatest sum formed by n consecutive elements, where n is the domain.
	 * 
	 * @param arr An integer array.
	 * @param domain The number of consecutive elements to form a sum from.
	 * @return The greatest sum formed.
	 */
	public static int findGreatestSum(int[] arr, int domain) {
		// return sum of entire array
		if (arr.length <= domain)
			return sumOfSubset(arr, 0, arr.length - 1);
			
		// initial sum
		int sum = sumOfSubset(arr, 0, domain - 1),
			maxSum = sum;

		for (int i = 1; i != arr.length - domain + 1; ++i) {
			// subtract previous element
			sum -= arr[i - 1];
			
			// add new element at the end of the selection
			sum += arr[i + domain - 1];
			
			// compare sums
			maxSum = Math.max(maxSum, sum);
		}
		
		return maxSum;
	}
}
