package knight;

public class Node {
    
    private int data;
    private Node up;
    private Node right;
    private Node down;
    private Node left;
    private static int count = 0;
    
    public Node() {
        this(0);
    }
    
    public Node(int data) {
        ++count;
        this.data = data;
        up = right = down = left = null;
    }

    public int data() {
        return data;
    }

    public void setData(int data) {
        this.data = data;
    }

    public Node up() {
        return up;
    }

    public void setUp(Node up) {
        this.up = up;
    }

    public Node right() {
        return right;
    }

    public void setRight(Node right) {
        this.right = right;
    }

    public Node down() {
        return down;
    }

    public void setDown(Node down) {
        this.down = down;
    }

    public Node left() {
        return left;
    }

    public void setLeft(Node left) {
        this.left = left;
    }
    
}
