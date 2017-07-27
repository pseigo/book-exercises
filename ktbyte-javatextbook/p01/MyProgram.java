import java.util.Scanner;

public class MyProgram {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println(42);

        // new scanner
        Scanner input = new Scanner(System.in);

        // get input from standard input and store in  s
        String s = input.nextLine();

        // print the value of  s
        System.out.println(s);


        System.out.print("Enter an integer: ");
        boolean passed = true;

        int number = 0;

        do
        {
            passed = true;
            
            try
            {
                number = input.nextInt();
            } catch (Exception error) {
                System.out.println("Invalid input.");
                input.nextLine();
                passed = false;
            }

            if (passed && number < 1 || number > 5) {
                System.out.println("Value is out of range.");
                passed = false;
            }
        } while (!passed);

        System.out.println("Number: " + number);
        input.close();


    }
}
