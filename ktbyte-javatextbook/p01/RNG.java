import java.lang.Math;
import java.lang.String;
import java.util.Formatter;

public class RNG {
    public static void main(String[] args) {
        // [5, 10)
        int min = 0,
            max = 10;

        for (int i = 0; i < 10; ++i) {
            int random = (int)(Math.random() * (max - min + 1) + min);
            // String output = String.format("%.2f", random);
            System.out.println(random);
        }

        /*
         * # Random Number Explanation:
         * Math.random() * (max - min + 1) + min
         *
         * Math.random() is a floating point number in (0, 1).
         * Multiply by domain relative to 0 max - min, and +1 to
         *  account for 0-based indexing.
         *
         * Add min to the whole calculation to vertically shift
         *  the function to min.
         *
         * The max will be `max.99999...` and the min will be `min.000001...`
         * Because we cast the expression to an `int`, the decimal
         *  is truncated and our new min becomes `min` and the max will
         *  be `max`.
        */
    }
}
