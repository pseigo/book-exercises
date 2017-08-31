package etiquette;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		// get # of seats
		System.out.println("How many seats are in the row?");
		int seats = read(in, 1);
		in.nextLine(); // flush stream
        System.out.println();

		boolean[] occupied = new boolean[seats];

		// get state of seats
		for (int i = 0; i != seats; ++i) {
			System.out.println("Is seat " + (i+1)
				+ " free? (Y/N)?");

			occupied[i] = read(in, "N", "Y");
			System.out.println();
		}

		in.close();

		// initialize row and get seat
		Row row = new Row(occupied);
		int seat = row.getFarthestSeat();

		if (seat == -1) {
			row.println();
			System.out.println("There are no seats available!");
		} else {
			row.println('^', seat);
			System.out.println("You should use seat " + (seat + 1) + "!");
		}
	}

    public static int read(Scanner in, int min) {
        int input;

        do {
            try {
            	System.out.print("> ");
                input = in.nextInt();
                if (input < min)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: must enter an integer "
                	+ "greater than or equal to " + min + ".\n");

                // clear bad input
                in.nextLine();
            }
        } while (true);

        return input;
    }

    public static boolean read(Scanner in, String accept, String decline) {
        String input;

        do {
            try {
            	System.out.print("> ");
                input = in.nextLine();

                input = input.toLowerCase();

                if (!input.equals(accept.toLowerCase())
                		&& !input.equals(decline.toLowerCase()))

                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: must input "
                    + accept + " or " + decline + ".\n");
            }
        } while (true);

        return input.equals(accept.toLowerCase());
    }
}
