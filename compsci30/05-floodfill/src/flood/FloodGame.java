package flood;

import java.util.Scanner;

public class FloodGame {

    public static LinkedGrid board = new LinkedGrid(20, 10);
    public static int moves = 0;
    
    public static void main(String[] args) {
        board.populate(1, 5);
        board.print();
        
        Scanner in = new Scanner(System.in);
        
        int input = 0;
        
        while (true) {
            if (checkForWin()) {
                System.out.println("Congratulations, you completed this puzzle in " + moves + " moves!");
                break;
            }
            
            System.out.println("Move #" + (++moves) + ".");
            input = in.nextInt();
            System.out.println();
            
            mutate(input);
            board.print();
            
            System.out.println();
        }
                
        in.close();
    }
    
    public static void mutate(int value) {
        // game starts from top left of board
        Node cell = board.get(0, 0);
        mutate(cell, value);
    }
    
    /**
     * Mutates nearby cells [relative to top left of grid] to the specified value.
     * @param cell Node to mutate.
     * @param rowShift Rows to shift before mutating.
     * @param colShift Columns to shift before mutating.
     * @param value Value that nearby cells will mutate into.
     */
    public static void mutate(Node cell, int value) {
        if (cell.data() == value)
            return;
        
        int oldValue = cell.data();
        
        // mutate current cell
        cell.setData(value);
        
        // mutate surrounding cells
        Node crawler = null;
        
        for (int i = 0; i != 4; ++i) {
            switch (i) {
                case 0: crawler = cell.up(); break;
                case 1: crawler = cell.right(); break;
                case 2: crawler = cell.down(); break;
                case 3: crawler = cell.left(); break;
            }
            
            if (crawler != null && crawler.data() == oldValue) {
//                System.out.println("MUTATION HAHAHAHAH");
                mutate(crawler, value);
                
//                break;
            }
            
        }
    }
    
    public static boolean checkForWin() {
        Node crawler = board.get(0, 0);
        Node rowMarker;
        
        // first cell in grid. every node must match this value
        int rootCell = crawler.data();

        // crawl as long as beginning of row exists
        while (crawler != null) {
            // point to beginning of row
            rowMarker = crawler;
            
            // check if each cell's data is consistent with rootCell
            while (crawler != null) {
                if (crawler.data() != rootCell)
                    return false;
                    
                crawler = crawler.right();
            }
            
            // point crawler to next row (if null, loop will exit)
            crawler = rowMarker.down();
            rowMarker = crawler;
        }
        
        return true;
    }
    

}
