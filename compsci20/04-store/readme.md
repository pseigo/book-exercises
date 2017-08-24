# Instructions
**CS20 Assignment 3: A Simple Store**
1. Write a class that includes variables that represent an amount of cash as well as a stock of four inventory items.  
2. After this, write a main program that initializes these values so that the inventory items are set
to zero and the money is set to $100.  
3. Write a method that prints the inventory item listing and the money to the screen.
4. Write a method that simulates a store where the user can enter the store and purchase items. When the user purchases an item, their inventory should increase and their money should decrease accordingly.  There should be an option to purchase multiples of the same items.

Sample Output:

```
Cash: $100
Inventory:
===================================
Bananas:    0
Milk:       0
Ice Cream:  0
Cups:       0

1. Purchase Bananas ($1 each)
2. Purchase Milk ($1 each)
3. Purchase Ice Cream ($2 each)
4. Purchase Cups ($0.50 each)
0. Exit

What would you like to do? 4
How many would you like to purchase? 3

Cash: $98.50
Inventory:
===================================
Bananas:    0
Milk:       0
Ice Cream:  0
Cups:       3

1. Purchase Bananas ($1 each)
2. Purchase Milk ($1 each)
3. Purchase Ice Cream ($2 each)
4. Purchase Cups ($0.50 each)
0. Exit

What would you like to do?
```
