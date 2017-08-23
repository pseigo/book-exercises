import java.util.Scanner;

public class Password {
    public static void main(String[] args) {
        String password = "password123";
        int tries = 3;

        System.out.println("You have " + tries + " tries to guess the password.");

        if (password(password, tries))
            System.out.println("Correct.");
        else
            System.out.println("Incorrect. You've used all " + tries + " tries.");
    }

    public static boolean password(String password, int tries) {
        Scanner in = new Scanner(System.in);
        String input;

        for (int i = 0; i != tries; ++i) {
            System.out.print("Enter the password ("
                + (i + 1) + "/" + tries
                + "): ");

            input = in.next();

            // NOTE: using the == operator compares references, NOT values.
            // must use String.equals(myString) member function.
            if (input.equals(password))
                return true;
        }

        return false;
    }
}
