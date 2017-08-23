import java.lang.Math;

public class Sum {
    public static void main(String[] args) {
        int n = 2345;
        System.out.println(sum(n));
    }

    public static int lengthOf(int num) {
        num = Math.abs(num);
        if (num < 10)
            return 1;
        return lengthOf(num / 10) + 1;
    }

    public static int sum(int num) {
        int sum = 0;
        int length = lengthOf(num);

        for (int i = length; i >= 0; --i) {
            // explicit cast to int truncates decimal in  digit
            int pow = (int)(Math.pow(10, i));
            int digit = num / pow;

            // add current digit to  sum
            sum += digit;

            // subtract leading digit from  num
            num -= digit * pow;
        }

        return sum;
    }
}
