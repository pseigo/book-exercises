import java.io.File;                // File
import java.io.FileOutputStream;    // FileOutputStream
import java.io.IOException;         // IOException
import java.io.PrintWriter;         // PrintWriter
import java.util.Scanner;           // Scanner


public class IOTest {
    public static void main(String[] args) throws IOException {
        final String filename = "out.txt";

        char test;
        System.out.println(test);

        // objects for writing to a file
        File outfile = new File(filename);
        FileOutputStream FOS = new FileOutputStream(outfile, true);
        PrintWriter output = new PrintWriter(FOS);

        Scanner input = new Scanner(System.in);

        String entry;
        while (input.hasNext()) {
            entry = input.nextLine();
            output.println(entry);
        }

        output.println("---- end of program. ---- \n");

        output.close();

        return;
    }
}
