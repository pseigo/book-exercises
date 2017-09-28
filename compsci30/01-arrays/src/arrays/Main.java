package arrays;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		final int SIZE = 1000000;
		int[] arr = new int[SIZE];
		
		// used for domain of getInt()
		int menuCount = printMenuAndGetElementCount();
		int menu = 0;
		
		do {
			// input for algorithms
			int element = 0, find;
			boolean found;
			
			menu = getInt(in, 0, menuCount);
			
			switch (menu) {
			case 0:
				System.out.println("Goodbye!");
			    break;
			case 1:
				ArraysAssignment.print(arr);
			    break;
			case 2:
				ArraysAssignment.fillRandom(arr, 1, SIZE);
			    break;
			case 3:
				ArraysAssignment.fillSequential(arr, 1);
			    break;
			case 4:
				ArraysAssignment.shuffle(arr);
			    break;
			case 5:
				System.out.print("Enter an element to search for: ");
				element = getInt(in);
				int index = ArraysAssignment.find(arr, element);
				
				if (index == -1)
					System.out.println("Element was not found in the array.");
				else
					System.out.println("Element found at index " + index + ".");
			    break;
			case 6:
				boolean nondecreasing = ArraysAssignment.isNonDecreasing(arr);
				System.out.println("Elements " + (nondecreasing ? "are" : "are not")
					+ " in non-decreasing order (" + nondecreasing + ").");
			    break;
			case 7:
				ArraysAssignment.bogosort(arr, 100000);
				boolean sorted = ArraysAssignment.isNonDecreasing(arr);
				System.out.println("Array was" + (sorted ? "" : " not")
					+ " successfully sorted (" + sorted + ").");
			    break;
			case 8:
				System.out.println(ArraysAssignment.getSmallestElement(arr));
			    break;
			case 9:
				System.out.println(ArraysAssignment.getLargestElement(arr));
			    break;
			case 10:
				System.out.print("Enter an element to search for: ");
				element = getInt(in);
				int occurrences = ArraysAssignment.findOccurrences(arr, element);
				
				System.out.println(element + " occurred " + occurrences + " times.");
			    break;
			case 11:
				System.out.print("Enter an element to find: ");
				find = getInt(in);
				System.out.print("\nEnter an element to replace " + find + " with: ");
				int replace = getInt(in);
				
				ArraysAssignment.replace(arr, find, replace);
			    break;
			case 12:
				System.out.println(ArraysAssignment.findGreatestSum(arr, 10));
			    break;
			case 13:
				System.out.print("Enter an element to find: ");
				find = getInt(in);
				found = ArraysAssignment.linearSearch(arr, find);
				System.out.println(find + " was" + (found ? "" : " NOT") + " found in the array.");
				break;
			case 14:
				System.out.print("Enter an element to find: ");
				find = getInt(in);
				found = ArraysAssignment.binarySearch(arr, find);
				System.out.println(find + " was" + (found ? "" : " NOT") + " found in the array.");
			case 15:
				ArraysAssignment.bubbleSort(arr);
				break;
			case 16:
				ArraysAssignment.selectionSort(arr);
				break;
			case 17:
				ArraysAssignment.insertionSort(arr);
				break;
			case 18:
				ArraysAssignment.quickSort(arr);
				break;
			case 19:
				arr = ArraysAssignment.radixSort(arr);
				break;
			default:
				System.out.println("That is not a valid option.");
				break;
			}
			
			System.out.println("Done.\n");
		} while (menu != 0);
		
		// cleanup: close scanner and the underlying readable (System.in)
		in.close();
	}
	
	public static int printMenuAndGetElementCount() {
		System.out.println("ARRAYS\n===========");
		String[] menu = {
			"0. Exit",
			"== Part 1 ==",
			"1. Display ",
			"2. Populate randomly",
			"3. Populate sequentially",
			"4. Shuffle",
			"== Part 2 ==",
			"5. Find first occurance of element",
			"6. Check if in non-decreasing order",
			"7. Bogosort: Shuffle until in non-decreasing order",
			"== Part 3 ==",
			"8. Print lowest value",
			"9. Print highest value",
			"10. Find number of occurences of element",
			"11. Find and replace an element",
			"12. Find range of 10 consecutive elements with the greatest sum",
			"== Comp Sci 30: Sorting and Searching ==",
			"13. Linear Search",
			"14. Binary Search",
			"15. Bubble Sort",
			"16. Selection Sort",
			"17. Insertion Sort",
			"18. Quicksort",
			"19. Radixsort"};
		
		for (int i = 0; i != menu.length; ++i) {
			System.out.println(menu[i]);
		}
		
		return menu.length - 4;
	}
	
    public static int getInt(Scanner in) {
        int input;

        do {
            try {
                input = in.nextInt();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: must enter an integer.\n");

                // clear bad input
                in.nextLine();
            }
        } while (true);

        return input;
    }

    public static int getInt(Scanner in, int min, int max) {
        int input;

        do {
            try {
                input = in.nextInt();
                if (input < min || input > max)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: must enter an integer between "
                    + min + " and " + max + ".\n");

                // clear bad input
                in.nextLine();
            }
        } while (true);

        return input;
    }

}
