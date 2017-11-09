package knight;

public class KnightsTour {

    public static int dimension = 5;
    public static int tiles = dimension * dimension;
    public static LinkedGrid board = new LinkedGrid(dimension);
    public static int paths = 0;
    
    public static void main(String[] args) {
        System.out.println("Discovering paths for " + tiles + " tiles.");
        System.out.println("(this will take a while..)");
        
        long start = System.currentTimeMillis();
        explore();
        long end = System.currentTimeMillis();
        
        System.out.println("===============\nCOMPLETE!");
        System.out.println("Board Size: " + dimension + " x " + dimension);
        System.out.println("Paths found: " + paths);
        System.out.println("Finished in " + (end - start) + " ms.");
    }
    
    public static void explore() {
        int pathsum = paths;
        for (int row = 0; row != dimension; ++row) {
            for (int col = 0; col != dimension; ++col) {
                explore(row, col);

                System.out.println((paths - pathsum) + "\t paths at \t(" + row + ", " + col + ").");
                pathsum += paths - pathsum;
            }
        }
    }
    
    public static void explore(int row, int col) {
        Node knight = board.get(0, 0);
        explore(knight, row, col, 1);
    }

    public static void explore(Node knight, int row, int col, int iteration) {
        knight = board.shift(knight, row, col);
        if (knight == null || knight.data() == 1)
            return;
        
        if (iteration == tiles) {
            ++paths;
//            System.out.println(paths);
            return;
        }
        
        // mark current tile as visited
        knight.setData(1);
        
        int iterationp1 = iteration + 1;
        
        // TODO replace arguments with [human] readable functions?
        explore(knight, -2, -1, iterationp1);
        explore(knight, -2, 1, iterationp1);
        
        explore(knight, -1, 2, iterationp1);
        explore(knight, 1, 2, iterationp1);
        
        explore(knight, 2, -1, iterationp1);
        explore(knight, 2, 1, iterationp1);
        
        explore(knight, -1, -2, iterationp1);
        explore(knight, 1, -2, iterationp1);
        
        // set current tile as unvisited once all moves have been attempted
        knight.setData(0);
    }

}
