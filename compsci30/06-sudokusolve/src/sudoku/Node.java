package sudoku;

import java.util.Arrays;

public class Node {
    
    private boolean solved;
    private boolean[] possible;
    private int boxId;
    
    private int data;
    private Node up;
    private Node right;
    private Node down;
    private Node left;
    public static int count = 0;
    
    public Node() {
        this(0);
    }
    
    public Node(int data) {
        this(data, 0);
    }
 
    public Node(int data, int boxId) {
        ++count;
        this.data = data;
        up = right = down = left = null;
        
        this.boxId = boxId;
        
        possible = new boolean[10];
        Arrays.fill(possible, true);
        possible[0] = false;
        
        solved = false;
    }
    
    public boolean solved() {
        return solved;
    }
    
    public boolean solved(boolean b) {
        this.solved = b;
        
        for (int i = 1; i != possible.length; ++i)
            possible[i] = false;
        
        return solved;
    }
    
    public boolean[] possible() {
        return possible;
    }
    
    /**
     * Returns whether n is possible for this node.
     * @param n Value for the cell to check.
     * @return
     */
    public boolean possible(int n) {
        return possible[n];
    }
    
    public boolean possible(int n, boolean possible) {
        this.possible[n] = possible;
        return possible;
    }
    
    // TODO TEMP TESTING
    public void setPossible(boolean[] arr) {
        if (arr.length != this.possible.length) {
            System.out.println("ERROR invalid size.");
            return;
        }
            
        System.out.println("set possible to: " + arr);
        this.possible = arr;
    }
    
    public void printPossibilities() {
        System.out.print("{");
        for (int i = 1; i != possible.length; ++i)
            System.out.print(possible[i] ? 1 : 0);
        System.out.print("} ");
    }
    
    public int boxId() {
        return boxId;
    }
    
    public void setBoxId(int boxId) {
        this.boxId = boxId;
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
