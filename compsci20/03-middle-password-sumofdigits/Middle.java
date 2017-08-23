import java.util.List;          // List
import java.util.ArrayList;     // ArrayList
import java.util.Collections;   // sort
import java.lang.Math;          // min, max

public class Middle {
    public static void main(String[] args) {
        int x = 1,
            y = 2,
            z = 3;

        System.out.println(middle_alt(x, y, z));
        return;
    }

    public static int middle(int x, int y, int z) {
        List<Integer> list = new ArrayList<Integer>();
        list.add(x);
        list.add(y);
        list.add(z);

        Collections.sort(list);
        return list.get(1);
    }

    public static int middle_alt(int a, int b, int c) {
        // source: https://stackoverflow.com/a/19045659/5164536
        return Math.max(Math.min(a, b), Math.min(Math.max(a, b), c));
    }
}
