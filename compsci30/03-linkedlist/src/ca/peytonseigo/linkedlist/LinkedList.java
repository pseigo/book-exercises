package ca.peytonseigo.linkedlist;

public class LinkedList {

    private int size;
    Node head;
    Node tail;

    public LinkedList() {
        size = 0;
    }

    public int length() {
        return size;
    }

    public void print() {
        if (size == 0)
            System.out.println("Error: LinkedList has no nodes to print.");

        Node crawler = head;
        while (crawler != null) {
            System.out.print(crawler.data() + " ");
            crawler = crawler.next();
        }

        System.out.println();

        crawler = tail;
        while (crawler != null) {
            System.out.print(crawler.data() + " ");
            crawler = crawler.prev();
        }
    }

    /**
     * Push Node to list in queue formation (end of list).
     * @param i Data for new Node
     */
    public void push_back(int i) {
        Node insert = new Node(i);

        // no nodes in the list, so point head to  insert
        // TODO condition might be (head == null) or (length == 0)
        if (head == null) {
            head = insert;
        } else {
            insert.setPrev(tail);
            tail.setNext(insert);
        }

        tail = insert;
        ++size;
    }

    public int pop(int index) {
        Node node = find(index);
        int stored = (tail == null) ? 0 : node.data();

        Node left = node.prev(), right = node.next();

        if (head == node)
            head = null;
        if (tail == node)
            tail = null;


        return stored;
    }

    /**
     * Pop Node from list in stack formation (end of list).
     * @return Integer stored in the popped Node
     */
    public int pop_back() {
        int stored = (tail == null) ? 0 : tail.data();

        if (size > 0) {
            if (tail != head) {
                Node tail = this.tail.prev();
                tail.setNext(null);
            } else {
                tail = head = null;
            }

            --size;
        }

        return stored;
    }

    /**
     * Pop Node from list in queue formation (front of list).
     * @return Integer stored in the popped Node
     */
    public int pop_front() {
        int stored = 0;
        if (size != 0) {
            stored = head.data();

            head = head.next();

            // if that was the last node, head is null so tail should be null
            if (head == null)
                tail = null;
            else // otherwise, remove reference to the OLD head
                head.setPrev(null);

            --size;
        }

        return stored;
    }

    /**
     * Pop Node from list in queue formation (front of list).
     * @return Integer stored in the popped Node
     */
    public int pop_front_alt() {
        int stored = (head == null) ? 0 : head.data();					

        if (head == tail) {
            // executes for either 0 or 1 nodes
            head = tail = null;
        } else {
            // executes for length > 1
            head = head.next();
            head.setPrev(null);
        }

        if (size > 0)
            --size;

        return stored;
    }

    public Node find(int data) {
        Node crawler = head;

        while (crawler != null) {
            if (crawler.data() == data)
                return crawler;

            crawler = crawler.next();
        }

        return null;
    }

    private void setPointer(Node node, Node target, String property) {
        property = property.toLowerCase();
        if (node != null) {
            if (property.equals("prev"))
                node.setPrev(target);
            else if (property.equals("next"))
                node.setNext(target);
        }
    }

    private Node getNode(int index) {
        Node crawler = head;
        for (int i = 0; i != index; ++i) {
            if (crawler != null)
                crawler = crawler.next();
        }

        return crawler; 
    }

    public void test() {
        //		System.out.println("test: " + getNode(2).i);
        System.out.println("test: " + getNode(2).data());
    }

    private boolean adjacent(Node node1, Node node2) {
        return node1.next() == node2;
    }

    private void swapAdjacent(Node node1, Node node2) {
        Node node1_left = node1.prev();
        Node node2_right = node2.next();

        // set previous and next for node1 and node2
        node1.setPrev(node2);
        node2.setNext(node1); 
    }

    private void swapSeparate(Node node1, Node node2) {
        Node node1_left = node1.prev(), node1_right = node1.next();
        Node node2_left = node2.prev(), node2_right = node2.next();

        // set previous and next for node1 and node2
        node1.setPrev(node2_left);
        node2.setNext(node1_right);

        node1_right.setPrev(node2);
        node2_left.setNext(node1);
    }

    public void swap(int nodeIndex1, int nodeIndex2) {
        // reverse indices if in non-ascending order
        if (nodeIndex1 > nodeIndex2) {
            int temp = nodeIndex1;
            nodeIndex1 = nodeIndex2;
            nodeIndex2 = temp;
        }
        
        // retrieve objects from indices
        Node node1 = getNode(nodeIndex1), node2 = getNode(nodeIndex2);
        
        // no swap possible or necessary
        if (node1 == null || node2 == null || node1 == node2)
            return;
        
        // left and right pointers relative to initial positions of nodes
        Node node1_left = node1.prev(), node1_right = node1.next();
        Node node2_left = node2.prev(), node2_right = node2.next();
        
        // adjust head/tail or prev/next nodes, depending on what's there
        if (node1_left != null)
            node1_left.setNext(node2); // point far left node to node2
        else
            head = node2;

        if (node2_right != null)
            node2_right.setPrev(node1); // point far right node to node1
        else
            tail = node1;

        // TODO make readable
        if (adjacent(node1, node2)) {
            node1.setPrev(node2);
            node2.setNext(node1);
        } else {
            node1.setPrev(node2_left);
            node2.setNext(node1_right);

            node1_right.setPrev(node2);
            node2_left.setNext(node1);
        }
            
        node1.setNext(node2_right);
        node2.setPrev(node1_left);
    }
    
    public void bubbleSort() {
//        Node crawler = head;
        
        int count = 0;
        
        while (getNode(count).next() != null) {
            swap(count, ++count);
        }
    }

}
