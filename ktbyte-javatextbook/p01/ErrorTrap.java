import java.util.Scanner;
import java.util.InputMismatchException;

public class ErrorTrap {
    public static void main(String[] args) {
        System.out.println("Please enter a number between 1 and 5: ");

        int number = read();
        System.out.println("Number: " + number);
    }

    public static int read()
    {
        int number = 0;
        boolean passed = true;

        Scanner input = new Scanner(System.in);

        do {
            passed = true;

            try {
                number = input.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Invalid input.");

                // clear stream of bad input
                input.nextLine();
                passed = false;
            }

            if (passed && (number < 1 || number > 5)) {
                System.out.println("Value is out of range.");
                passed = false;
            }

        } while(!passed);

        input.close();
        return number;
    }
}
