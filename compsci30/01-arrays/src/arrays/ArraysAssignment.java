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
		for (int i = 0; i != maxAttempts; ++i) {
			if (isNonDecreasing(arr))
				return;
			else
				shuffle(arr);
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
	
	// =========================== Comp Sci 30: Sorting ===========================
	public static boolean linearSearch(int[] arr, int find) {
		for (int i : arr)
			if (i == find)
				return true;
		return false;
	}
	
	/**
	 * Iterative implementation of binary search. TODO implement recursively with tail call optimization.
	 * @return If element is found in array.
	 */
	public static boolean binarySearch(int[] arr, int find, int left, int right) {
		// when  find > max element, out of bounds occurs
		if (find > arr[arr.length - 1])
			return false;
		
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
	
	public static boolean binarySearch(int[] arr, int find) {
		return binarySearch(arr, find, 0, arr.length);
	}
	
	
	public static void swap(int[] arr, int x, int y) {
		int temp = arr[x];
		arr[x] = arr[y];
		arr[y] = temp;
	}
	
	public static void bubbleSort(int[] arr) {
		boolean sorted = false;
		
		while (!sorted) {
			sorted = true;
			for (int i = 0; i != arr.length - 1; ++i) {
				if (arr[i] > arr[i+1]) {
					swap(arr, i, i+1);
					sorted = false;
				}
			}
		}
	}
	
	public static void selectionSort(int[] arr) {
		for (int i = 0; i != arr.length; ++i) {
			
			int min = arr[i], min_index = i;
			for (int j = i + 1; j != arr.length; ++j) {
				if (arr[j] < min) {
					min = arr[j];
					min_index = j;
				}
			}
			
			swap(arr, i, min_index);
		}
	}

	public static void insertionSort(int[] arr) {		
		int i, j, key;
		for (i = 1; i != arr.length; ++i) {
			key = arr[i];
			
			// shift elements to the right
			for (j = i - 1; j >= 0 && (key < arr[j]); --j) {
				arr[j + 1] = arr[j];
			}
			
			// done shifting; j+1 is the proper sorted position for  key
			arr[j + 1] = key;
		}
		
	}
	
	public static boolean quickSort(int[] arr, int min, int max) { 		
		// already sorted; either 0 or 1 elements
		if (max - min < 2)
			return true;
		
		int left = min,
			right = max,
			pivot = left;
		
		while (left < right) {
			while (arr[pivot] >= arr[left] && left < pivot)
				++left;
			
			while (arr[pivot] <= arr[right] && right > pivot)
				--right;
			
			// is there an implicit way to run this? it should
			// not run if left == right because they're at the same
			// index and both pointing to the pivot.
			if (left != right) {
				swap(arr, left, right);
				
				// if moved pivot, move pivot to swapped location
				if (pivot == left)
					pivot = right;
				else if (pivot == right)
					pivot = left;
			}	
		}
		
		// sort left side
		quickSort(arr, min, right - 1);
		
		// sort right side
		quickSort(arr, left + 1, max);
		
		// finished sorting entire array
		return true;
	}
	
	public static void quickSort(int[] arr) {
		quickSort(arr, 0, arr.length - 1);
	}
	
	/**
	 * Returns digit at given  place  for  n. n = 1 is tens, n = 2 is hundreds, etc.
	 * Assumes  n has infinite leading zeros.
	 * 
	 * @param n Number to get digit from.
	 * @param place
	 * @return Digit at  place. 
	 */
	private static int digitAt(int n, int place) {
		n = Math.abs(n);
		for (int i = 0; i != place - 1; ++i)
			n /= 10;
		
		return n % 10;
	}

	public static int[] radixSort(int[] arr) {
		// get max digit length
		int max_digit_length = 0;
		for (int i : arr)
			max_digit_length = Math.max(max_digit_length, lengthOf(i));
		
		for (int pass = 1; pass <= max_digit_length; ++pass) {
			int[] sorted = new int[arr.length];
			int insert_count = 0;
			
			for (int i = 0; i != 10; ++i) {
				for (int j = 0; j != arr.length; ++j) {
					if (digitAt(arr[j], pass) == i)
						sorted[insert_count++] = arr[j];
				}
			}
			
			arr = sorted;
		}
		
		return arr;
	}
	
}
