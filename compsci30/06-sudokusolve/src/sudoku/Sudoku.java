package sudoku;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

public class Sudoku {

    public static LinkedGrid board = new LinkedGrid(9);
    public static boolean boardSolved = false;
    
    public static void main(String[] args) {
        File infile = new File("sudoku.txt");
        
        // import board
        try {
            importBoard(infile);
            boardSolved = false;
        } catch (FileNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
        }
        
        // eliminate possibilities for nodes that are already solved
        for (int i = 0; i != 10; ++i) {
            for (Node row = board.root(); row != null; row = row.down()) {
                for (Node col = row; col != null; col = col.right()) {
                    if (col.solved()) {
                        eliminate(col, col.data());
                    }
                }
            }
        }
        
        // begin solve logic
        for (int i = 0; i != 10; ++i) {
            for (Node row = board.root(); row != null; row = row.down()) {
                for (Node col = row; col != null; col = col.right()) {
                    if (col.solved()) {
                        eliminate(col, col.data());
                    }
                }
            }
            
            for (Node row = board.root(); row != null; row = row.down()) {
                for (Node col = row; col != null; col = col.right()) {
                    solveOnePossibility(col);
                }
            }
            
            solveOnlySolutionInRow();
            solveOnlySolutionInCol();
            solveOnlySolutionInBox();
//            eliminateExclusivePossibilities(); // unfinished
        }
        
      solveRecursively(board.root());
//        
        board.print();
    }

    public static void importBoard(File infile) throws FileNotFoundException {
        Scanner input = new Scanner(infile);
        
        for (Node row = board.root(); row != null; row = row.down()) {
            for (Node col = row; col != null; col = col.right()) {
                if (!input.hasNext()) {
                    input.close();
                    return;
                }
                
                col.setData(input.nextInt());
                if (col.data() != 0)
                    col.solved(true);
            }
        }
        
        input.close();
    }
    
    /**
     * Eliminate possibilities for all nodes in the same row as  node.
     * @param node Reference node
     * @param data Possibility to eliminate for each node
     */
    public static void eliminateRow(Node node, int data) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.left() : node.right()) {
                node.possible(data, false);
            }
        }
    }
    
    /**
     * Eliminate possibilities for all nodes in the same column as  node.
     * @param node Reference node
     * @param data Possibility to eliminate for each node
     */
    public static void eliminateCol(Node node, int data) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.up() : node.down()) {
                node.possible(data, false);
            }
        }
    }

    // TODO handle invalid boxId (out of bounds)
    public static Node firstNodeInBox(int boxId) {
        Node crawler = board.root();
        int boxRow = (boxId - 1) / 3,
            boxCol = (boxId - 1) % 3;
        
        // shift rows
        for (int i = 0; i != boxRow; ++i) {
            for (int shift = 0; shift != 3; ++shift) {
                  crawler = crawler.down();
            }
        }
        
        // shift columns
        for (int i = 0; i != boxCol; ++i) {
            for (int shift = 0; shift != 3; ++shift) {
                  crawler = crawler.right();
            }
        }
        
        return crawler;
    }

    /**
     * Eliminate possibilities for all nodes with the same boxId as  node.
     * @param node Reference node
     * @param data Possibility to eliminate for each node
     */
    public static void eliminateBox(Node node, int data) {
        node = firstNodeInBox(node.boxId());
        
        // keep track of which row we're on. used to move node back to start of next row
        Node rowMarker = node;
        
        for (int row = 0; row != 3; ++row) {
            for (int col = 0; col != 3; ++col) {
                node.possible(data, false);
                node = node.right();
            }
            
            // move to start of next row in box
            rowMarker = rowMarker.down();
            node = rowMarker;
        }
    }
    
    public static void eliminate(Node node, int data) {
        eliminateRow(node, data);
        eliminateCol(node, data);
        eliminateBox(node, data);        
    }
    
    public static void solve(Node node, int solution) {
        node.setData(solution);
        node.solved(true);
        eliminate(node, solution);
    }
    
    // TODO rename
    /**
     * Solves nodes with only one possibility remaining.
     * @param node
     */
    public static void solveOnePossibility(Node node) {
        int count = 0, solution = 0;
        for (int i = 1; i != 10; ++i) {
            if (node.possible(i)) {
                ++count;
                solution = i;
            }
        }
        
        if (count == 1)
            solve(node, solution);
    }
    
    /**
     * Solves nodes that are the only node in that row with that solution.
     * @param node
     */
    public static void solveOnlySolutionInRow() {
        Node last = null;
        
        // records number of nodes in a region that have a possible solution
        int possibilityMatches = 0,
            solution = 0;
        
        for (Node row = board.root(); row != null; row = row.down()) {
            for (int possibility = 1; possibility != 10; ++possibility) {
                for (Node col = row; col != null; col = col.right()) {
                    if (col.possible(possibility)) {
                        last = col;
                        solution = possibility;
                        ++possibilityMatches;
                    }
                }
                
                // only possibility in the row; solve the node
                if (possibilityMatches == 1) {
//                    System.out.print("SOLVED! " + last.boxId());
//                    last.printPossibilities();
//                    System.out.println("BEFORE");
//                    board.print();
//                    
//                    System.out.println("AFTER");
                    solve(last, solution);
//                    board.print();
                    
                }
                
                // reset for next possibility to check
                possibilityMatches = 0;
            }
        }
    }
    
    /**
     * Solves nodes that are the only node in that column with that solution.
     * @param node
     */
    public static void solveOnlySolutionInCol() {
        Node last = null;
        
        // records number of nodes in a region that have a possible solution
        int possibilityMatches = 0,
            solution = 0;
        
        for (Node col = board.root(); col != null; col = col.right()) {
            for (int possibility = 1; possibility != 10; ++possibility) {
                for (Node row = col; row != null; row = row.down()) {
                    if (row.possible(possibility)) {
                        last = row;
                        solution = possibility;
                        ++possibilityMatches;
                    }
                }
                
                // only possibility, solve the node
                if (possibilityMatches == 1) {
                    solve(last, solution);
                }
                
                // reset for next possibility to check
                possibilityMatches = 0;
            }
        }
    }
    
    /**
     * this is a disaster.. please take the time to save a child
     */
    public static void solveOnlySolutionInBox() {
        // TODO rewrite without hard-coded/magic coordinates
        // coordinates of top left cell for each box; index is boxId - 1
        int[] coords = {00, 03, 06, 30, 33, 36, 60, 63, 66};
        Node crawler = null, origin = null, last = null;

        
        // for each box in the grid
        for (int box = 0; box != coords.length; ++box) {
            int coord = coords[box];
            origin = crawler = board.get((int)(coord/10), coord % 10);
            
            // for each possibility in a single box
            for (int possibility = 1; possibility != 10; ++possibility) {
                int possibilityMatches = 0,
                        solution = 0;
                
                // keep track of which row we're on -- used to move node back to start of next row
                Node rowMarker = crawler;
                
                // crawl through 3 rows
                for (int row = 0; row != 3; ++row) {
                    // crawl through 3 columns in the row
                    for (int col = 0; col != 3; ++col) {
                        // track possibilities
                        if (crawler.possible(possibility)) {
                            last = crawler;
                            solution = possibility;
                            ++possibilityMatches;
                        }
                        
                        crawler = crawler.right();
                    }
                    
                    // move to start of next row in box
                    crawler = rowMarker = rowMarker.down();
                }
                
                // only possibility, solve the node
                if (possibilityMatches == 1) {
                    solve(last, solution);
                }
                
                // return to the box's origin
                crawler = origin;
            }
            
        }
    }

    public static void eliminateRow(Node node, Node[] exceptions, int data) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.left() : node.right()) {
                // don't eliminate node if it is an exception
                for (int i = 0; i != exceptions.length; ++i) {
                    if (node == exceptions[i]) {
                        break;
                    }
                }
                
                node.possible(data, false);
            }
        }
    }
    
    /**
     * Eliminate possibilities for all nodes in the same column as  node.
     * @param node Reference node
     * @param data Possibility to eliminate for each node
     */
    public static void eliminateCol(Node node, Node[] exceptions, int data) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.up() : node.down()) {
                // don't eliminate node if it is an exception
                for (int i = 0; i != exceptions.length; ++i) {
                    if (node == exceptions[i]) {
                        break;
                    }
                }
                
                node.possible(data, false);
            }
        }
    }
    
    public static int valueMatchCount(boolean[] arr, boolean value) {
        int count = 0;
        for (int i = 0; i != arr.length; ++i)
            ++count;
        
        return count;
    }
    
    // TODO rename this to something MEANINGFUL!! seriously
    // TODO make generic iteration methods. these were copy+pasted from the eliminate() logic
    /**
     * When n nodes share the same n solutions in a section, eliminate those n solutions for
     * every other node in the section.
     */
    public static void eliminateExclusivePossibilities() {
       byte identicalNodesFound = 0;
       
       // repeat for every node in the grid 
       for (Node row = board.root(); row != null; row = row.down()) {
           for (Node origin = row; row != null; origin = origin.right()) {
               int originPossibilityCount = valueMatchCount(origin.possible(), true);
               Node[] identicals = new Node[originPossibilityCount];
               
               // TODO encapsulate into its own method
               // store possible solutions so we can eliminate them later
               int[] solutions = new int[originPossibilityCount];
               int solutionsIndexCount = 0; // temp variable to add solutions to array
               boolean[] originPossibilities = origin.possible();
               
               for (int i = 0; i != origin.possible().length; ++i) {
                   if (originPossibilities[i]) {
                       solutions[solutionsIndexCount++] = i;
                   }
               }
               
               // iterate through row
               for (int pass = 0; pass != 2; ++pass) {
                   for (Node crawler = origin; crawler != null; crawler = (pass == 0) ? crawler.left() : crawler.right()) {
                       // if possibilities are identical
                       if (Arrays.equals(origin.possible(), crawler.possible()) && crawler != origin) {
                           // store the identical node (for eliminating) and increment identicalNodesFound
                           identicals[identicalNodesFound++] = crawler;
                       }
                   }
               }
               
               // eliminate all OTHER nodes in that section
               if (identicalNodesFound == originPossibilityCount - 1) {
                   for (int i = 0; i != originPossibilityCount; ++i) {
                       eliminateRow(origin, identicals, solutions[i]);
                   }
               }
               
               // iterate through column
               
               // iterate through box
//               if (Arrays.equals(origin., a2)
           }
       }
    }
    
    public static boolean solutionWillConflictRow(Node node, int solution) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.left() : node.right()) {
                if (node != origin && node.data() == solution) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    public static boolean solutionWillConflictCol(Node node, int solution) {
        Node origin = node;
        
        for (int pass = 0; pass != 2; ++pass) {
            for (node = origin; node != null; node = (pass == 0) ? node.up() : node.down()) {
                if (node != origin && node.data() == solution) {
                    return true;
                }
            }
        }
        
        return false;    
    }
    
    public static boolean solutionWillConflictBox(Node node, int solution) {
        node = firstNodeInBox(node.boxId());
        Node origin = node;
        
        // keep track of which row we're on. used to move node back to start of next row
        Node rowMarker = node;
        
        for (int row = 0; row != 3; ++row) {
            for (int col = 0; col != 3; ++col) {
                if (node != origin && node.data() == solution) {
                    return true;
                }
                
                node = node.right();
            }
            
            // move to start of next row in box
            rowMarker = rowMarker.down();
            node = rowMarker;
        }
        
        return false;
    }
    
    /**
     * Returns true if the given solution conflicts with other nodes in that node's sections.
     */
    public static boolean solutionWillConflict(Node node, int solution) {
        if (solutionWillConflictRow(node, solution) ||
            solutionWillConflictCol(node, solution) ||
            solutionWillConflictBox(node, solution)) {
            return true;
        }
        
        return false;
    }
    
    /**
     * Returns the next node without data. Note that we aren't using node.solved(),
     * because for the recursive algorithm we are only changing the data of the node
     * so that the changes are reversible.
     * @return
     */
    public static Node nextNodeWithData(int data) {
        for (Node row = board.root(); row != null; row = row.down()) {
            for (Node col = row; col != null; col = col.right()) {
                
                if (col.data() == data) {
                    return col;
                }
            }
        }
        
        return null;
    }
    
    public static void solveRecursively(Node node) {
        for (int i = 1; i != node.possible().length; ++i) {
            if (boardSolved) return;                       // finished solving!
            if (!node.possible(i)) continue;               // only solve possible solutions
            if (solutionWillConflict(node, i)) continue;   // try next possibility
            
            // set solution but do not eliminate possibilities or set as solved
            node.setData(i);
            Node nextUnsolved = nextNodeWithData(0);
            
            if (nextUnsolved == null) {
                boardSolved = true;
                return;
            }
            
            solveRecursively(nextUnsolved);
        }
        
        // exhausted all possibilities, reset to 0
        if (!boardSolved) {
            node.setData(0);
        }
    }
}