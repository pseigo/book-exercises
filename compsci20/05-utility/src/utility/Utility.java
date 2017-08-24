package utility;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Utility {
    public static int errorTrap(int min, int max) {
        Scanner in = new Scanner(System.in);
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
        
        in.close();
        return input;
    }

    public static double errorTrap(double min, double max) {
        Scanner in = new Scanner(System.in);
        double input;

        do {
            try {
                input = in.nextDouble();
                if (input < min || input > max)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: must enter a number between "
                    + min + " and " + max + ".\n");

                // clear bad input
                in.nextLine();
            }
        } while (true);

        in.close();
        return input;
    }

    public static int rand(int min, int max) {
        // swap
        if (min > max) {
            int temp = min;
            min = max;
            max = temp;
        }

        return (int)(Math.random() * (max - min + 1) + min);
    }

    public static int digitAt(int number, int n) {
        // 0-based indexing
        n--;

        // if negative, skip the - sign
        if (number < 0)
            n++;

        // convert int to string
        String number_string = Integer.toString(number);

        int digit;
        try {
            // get char at  n  and convert to int
            digit = Character.getNumericValue(number_string.charAt(n));
        } catch (StringIndexOutOfBoundsException e) {
            System.out.println("Error: no digit exists at index " + (n + 1));
            return number;
        }

        return digit;
    }

    public static char getChar() {
        Scanner in = new Scanner(System.in);
        String input = "";

        if (in.hasNext()) {
            input = in.next();
            in.close();
            return input.charAt(0);
        }
        
        in.close();
        return '0'; // no input
    }
}
