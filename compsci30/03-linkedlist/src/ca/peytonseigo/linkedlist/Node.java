package ca.peytonseigo.linkedlist;

public class Node {
	// contained data
	private int data; // TODO better name?

	// pointers
	private Node next;
	private Node prev;
	
	public Node() {
		this(0);
	}
	
	public Node(int data) {
		this(data, null, null);
	}
	
	public Node(int data, Node next, Node prev) {
		this.data = data;
		this.next = next;
		this.prev = prev;
	}
	
	// Getters
	public int data() {
		return data;
	}
	
	public Node next() {
		return next;
	}
	
	public Node prev() {
		return prev;
	}
	
	// Setters
	public void setData(int data) {
		this.data = data;
	}
	
	public void setNext(Node next) {
		this.next = next;
	}
	
	public void setPrev(Node prev) {
		this.prev = prev;
	}
	
}
