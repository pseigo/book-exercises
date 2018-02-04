package sudoku;

public class LinkedGrid {
    
    private Node root;
    private int rows, cols;

    public LinkedGrid() {
        this(0, 0);
    }
    
    public LinkedGrid(int dimension) {
        this(dimension, dimension);
    }

    public LinkedGrid(int rows, int cols) {
        // invalid size
        if (rows * cols < 1)
            return;
        
        this.rows = rows;
        this.cols = cols;
        Node spawner = null, marker = null;  
        
        // TODO rename to something more useful
        int idStart = 1,
            idIncrement = 0;  
        
        // create first node in first row
        spawner = new Node(1, idStart + idIncrement);
        root = spawner;
        marker = spawner;
        
        // create rest of first row
        for (int col = 1; col < cols; ++col) {
            if (col % 3 == 0)
                ++idIncrement;
                
            spawner = new Node(1, idStart + idIncrement);
            marker.setRight(spawner);
            spawner.setLeft(marker);
            marker = spawner;
        }
        
        // set marker back to first node
        marker = root;
        Node rowMarker = marker;
        
        // create any rows following the first
        for (int row = 1; row < rows; ++row) {
            idIncrement = 0;
            
            // increment starting row ID by 3
            if (row % 3 == 0)
                idStart += 3;
                            
            // create first node in new row
            spawner = new Node(1, idStart + idIncrement);
            marker.setDown(spawner);
            spawner.setUp(marker);
            
            marker = spawner;
            rowMarker = spawner;
            
            for (int col = 1; col < cols; ++col) {
                if (col % 3 == 0)
                    ++idIncrement;
                    
                spawner = new Node(1, idStart + idIncrement);
                marker.setRight(spawner);
                spawner.setLeft(marker);
                spawner.setUp(marker.up().right());
                spawner.up().setDown(spawner);
                marker = spawner;
            }
            marker = rowMarker;
        }
        
    }
    
    public Node root() {
        return root;
    }

    public void print() {
        for (Node row = root; row != null; row = row.down()) {
            for (Node col = row; col != null; col = col.right()) {
//                col.printPossibilities();
                System.out.print(col.data() + " ");
            }
            System.out.println();
        }
    }
    
    public void print(Node node) {
        if (node != null)
            System.out.println(node.data());
    }
    
    public void print(int row, int col) {
        Node node = get(row, col);
        print(node);
    }
    
    /**
     * Traverses to given coordinates from the root of the board.
     * @param row
     * @param col
     * @return
     */
    public Node get(int row, int col) {
        if (row >= rows || row < 0 || col >= cols || col < 0)
            return null;
        
        Node crawler = root;
        
        for (int i = 0; i != row; ++i)
            crawler = crawler.down();
        
        for (int i = 0; i != col; ++i)
            crawler = crawler.right();
        
        return crawler;
        
    }
    
    // TODO refactor so shift() doesn't need to check which direction
    // to travel each time it shifts, and that the code isn't reused 4 times.
    public Node shift(Node node, int rowShift, int colShift) {
        // shift rows
        if (rowShift < 0) {
            for (int i = 0; i != Math.abs(rowShift); ++i) {
                if (node != null)
                    node = node.up();
                else
                    break;
            }
        } else {
            for (int i = 0; i != Math.abs(rowShift); ++i) {
                if (node != null)
                    node = node.down();
                else
                    break;
            }
        }
        
        if (colShift < 0) {
            for (int i = 0; i != Math.abs(colShift); ++i) {
                if (node != null)
                    node = node.left();
                else
                    break;
            }
        } else {
            for (int i = 0; i != Math.abs(colShift); ++i) {
                if (node != null)
                    node = node.right();
                else
                    break;
            }
        }
        
        return node;
    }
    
    public void set(int row, int col, int data) {
        Node node = get(row, col);
        
        if (node != null)
            node.setData(data);
    }
    
    private int rand(int min, int max) {
        return (int)(Math.random() * (max - min + 1) + min);
    }
    
    /**
     * Populates grid with random numbers for [min, max].
     */
    public void populate(int min, int max) {
        Node crawler = root;
        Node rowMarker = root;

        // crawl as long as beginning of row exists
        while (crawler != null) {
            // point to beginning of row
            rowMarker = crawler;
            
            // set values for row
            while (crawler != null) {
                crawler.setData(rand(min, max));
                crawler = crawler.right();
            }
            
            // point crawler to next row (if null, loop will exit)
            crawler = rowMarker.down();
            rowMarker = crawler;
        }
    }
}
