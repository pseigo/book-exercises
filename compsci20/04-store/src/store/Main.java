package store;

public class Main {
    public static void main(String[] args) {
        Store store = new Store();

        // breaks when user quits game
        mainMenuLoop(store);
    }

    public static void mainMenuLoop(Store store) {
        int menuInput = 0;
        do {
            store.printMainMenu();
            menuInput = Store.getInput(0, 1);
            System.out.println();

            if (menuInput == 1) {
                storeLoop(store);
            }

        } while (menuInput != 0);
    }

    public static void storeLoop(Store store) {
        int menuInput = 0;
        do {
            store.printMoney();
            store.printInventory();
            System.out.println();
            store.printPurchaseMenu();

            System.out.println("\nWhat would you like to do?");
            menuInput = Store.getInput(0, store.getItemCount());

            if (menuInput != 0) {
                store.makePurchase(menuInput);
            }

            System.out.println();
        } while (menuInput != 0);
    }
}
