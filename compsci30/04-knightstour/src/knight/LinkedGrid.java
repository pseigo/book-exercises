package knight;

public class LinkedGrid {
    
    private Node root;
    private int dimension;

    public LinkedGrid() {
        this(0);
    }
    
    public LinkedGrid(int dimension) {
        this.dimension = dimension;
        
        // invalid size
        if (dimension < 1)
            return;
        
        Node spawner = null, marker = null;   
          
        // create first node in first row
        spawner = new Node();
        root = spawner;
        marker = spawner;
        
        // create rest of first row
        for (int i = 1; i < dimension; ++i) {
            spawner = new Node();
            marker.setRight(spawner);
            spawner.setLeft(marker);
            marker = spawner;
        }
        
        // set marker back to first node
        marker = root;
        Node rowMarker = marker;
        
        // create any rows following the first
        for (int row = 1; row < dimension; ++row) {
            // create first node in new row
            spawner = new Node();
            marker.setDown(spawner);
            spawner.setUp(marker);
            
            marker = spawner;
            rowMarker = spawner;
            
            for (int col = 1; col < dimension; ++col) {
                spawner = new Node();
                marker.setRight(spawner);
                spawner.setLeft(marker);
                spawner.setUp(marker.up().right());
                spawner.up().setDown(spawner);
                marker = spawner;
            }
            marker = rowMarker;
        }
        
    }
    
    public int dimension() {
        return dimension;
    }
    
    public void print() {
        Node crawler = root;
        Node rowMarker = root;

        // print as long as beginning of row exists
        while (crawler != null) {
            // point to beginning of row
            rowMarker = crawler;
            
            // print row
            while (crawler != null) {
                System.out.print(crawler.data() + " ");
                crawler = crawler.right();
            }
            
            // point crawler to next row (if null, loop will exit)
            crawler = rowMarker.down();
            rowMarker = crawler;
            
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
        if (row >= dimension || row < 0 || col >= dimension || col < 0)
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
}
