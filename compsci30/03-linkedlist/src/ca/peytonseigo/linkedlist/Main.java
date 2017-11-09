package ca.peytonseigo.linkedlist;

public class Main {

	public static void main(String[] args) {
		LinkedList list = new LinkedList();
	
		list.push_back(3);
		list.push_back(1);
		list.push_back(10);
		list.push_back(43);
		list.push_back(6);
		
//		list.test();
//		list.swap(3, 4);
//		System.out.println(list.find(5));
//		list.popAlt();
		
		System.out.println(list.length());
		list.print();
	}

}
