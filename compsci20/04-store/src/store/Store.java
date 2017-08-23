package store;

import java.lang.Math;                      // Math.max()
import java.util.Arrays;                    // Arrays.fill()
import java.util.ArrayList;                 // ArrayList<>
import java.text.DecimalFormat;             // DecimalFormat
import java.util.Scanner;                   // Scanner
import java.util.InputMismatchException;    // InputMismatchException

public class Store {

    private double money;
    private String[] itemNames = {"Bananas", "Milk", "Ice Cream", "Cups"};
    private Double[] itemCosts = {1.0, 1.0, 2.0, 0.5};
    ArrayList<Item> items = new ArrayList<Item>();

    // constructor
    public Store() {
        reset();
    }

    public void reset() {
        money = 100;

        for (int i = 0; i != itemNames.length; ++i) {
            Item item = new Item();
            item.name = itemNames[i];
            item.cost = itemCosts[i];

            items.add(item);
        }
    }

    // TODO pass items as an argument
    private int longestItemLength() {
        int max = 0;
        for (String s : itemNames) {
            max = Math.max(max, s.length());
        }

        return max;
    }

    public void printMoney() {
        DecimalFormat df = new DecimalFormat("\u00A40.00");
        System.out.println("Money: " + df.format(money));
    }

    public void printInventory() {
        int padding, base = longestItemLength();
        if (longestItemLength() < 6)
            padding = 11;
        else
            padding = base + 6;

        // print top divider
        char[] divider = new char[padding + 8];
        Arrays.fill(divider, '=');
        System.out.println(divider);

        // see Javadocs for java.util.Formatter; this implements a Formatter internally
        System.out.format("%-" + padding + "s%s\n", "ITEM NAME", "QUANTITY");

        // print small divider
        Arrays.fill(divider, '-');
        System.out.println(divider);

        // print item names and quantities
        for (int i = 0; i != items.size(); ++i) {
            Item item = items.get(i);
            System.out.format("%-" + padding + "s%s\n", item.name, item.quantity);
        }
    }

    public void printMainMenu() {
        System.out.println("MAIN MENU");
        System.out.println("===============");
        System.out.println("1. Go to the store");
        System.out.println("0. Exit");
    }

    public void printPurchaseMenu() {
        DecimalFormat df = new DecimalFormat("\u00A40.00");
        for (int i = 0; i != items.size(); ++i) {
            String name = items.get(i).name;
            double cost = items.get(i).cost;

            System.out.println(
                (i + 1) + ". Purchase " + name
                + " (" + df.format(cost) + " each)"
            );
        }

        System.out.println("0. Exit");
    }

    /* NOTE
     * Java passes arguments by value. However, variables are just references
     * to objects. Their references are copied by value to the function. Therefore,
     * if you try to change the objects themselves, nothing will happen because
     * it's just a copy. HOWEVER, if you change a *member* of that variable, because
     * it's a reference to the original object, the original argument will change.
     * (this might be a bit inaccurate as it's based on my first impression of the conceptr)
    */
    public void purchaseItem(Item item, int quantity) {
        double cost = item.cost * quantity;
        if (!hasSufficientFunds(cost))
            throw new IllegalArgumentException("cannot purchase item, insufficient funds");

        if (quantity < 0)
            throw new IllegalArgumentException("cannot purchase item, quantity must be a positive integer");

        item.quantity += quantity;
        money -= cost;
    }

    public void purchaseItem(int index, int quantity) {
        if (index < 0 || index > items.size())
            throw new ArrayIndexOutOfBoundsException("cannot purchase item, index is out of bounds");

        if (quantity < 0)
            throw new IllegalArgumentException("cannot purchase item, quantity must be a positive integer");

        purchaseItem(items.get(index), quantity);
    }

    public boolean hasSufficientFunds(double cost) {
        return cost <= money ? true : false;
    }

    public static int getInput(int min, int max) {
        Scanner in = new Scanner(System.in);
        int input = 0;

        while (true) {
            try {
                System.out.print("> ");
                input = in.nextInt();
                if (input < min || input > max)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: input must be a number between "
                    + min + " and " + max + ".\n");

                // clear bad input
                in.nextLine();
            }
        }

        return input;
    }

    public static int getInput(int min) {
        Scanner in = new Scanner(System.in);
        int input = 0;

        while (true) {
            try {
                System.out.print("> ");
                input = in.nextInt();
                if (input < min)
                    throw new InputMismatchException();
                break;
            } catch (InputMismatchException e) {
                System.out.println("Error: input must be a number greater than "
                    + min + ".\n");

                // clear bad input
                in.nextLine();
            }
        }

        return input;
    }

    public void makePurchase(int itemIndex)
    {
        // items in the purchase list start at 1 instead of 0
        itemIndex -= 1;

        int quantity = 0;
        while (true) {
            try {
                System.out.println("How many would you like to purchase?");
                quantity = getInput(0);
                purchaseItem(itemIndex, quantity);
                break;
            } catch (IllegalArgumentException e) {
                System.out.println("Error: " + e.getMessage() + "! (IllegalArgumentException)\n");
            }
        }
    }
}
