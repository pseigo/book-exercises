# Instructions
**CS 20 Classes Assignment**
1. Write a class called Human that has the following data members:
    - Name
    - Age
    - Gender
2. Write an appropriate constructor for these data members.
3. Write getters (accessors) and setters (modifiers) for each of the three data members. These should be as per standard with the following exception:
    - If the age is over 30, there is a 30% chance that the getter for age will return `age - 5`.
4. Write a method called “add” that will output and return the sum of two integer parameters.
example:
    - Main program:     `Bruno.add (4,5);`
    - On Screen:        `Bruno says: the sum is 9.`
    - Function Returns: `9`
5. Overload the “add” method to accept two integer numbers below ten written as strings.  The program should return a `–1` and print an error if the numbers are not recognized.
example:
    - Main program:         `Bruno.add (“four”, “five”);`
    - On Screen:            `Bruno says: the sum is 9.`
    - Function Returns:     `9`
6. Overload the constructor with two additional constructors that allow the Human to be created with
    - specific name,
    - a specific age and gender.
7. Write appropriate printing functions for the Human class (ie. showAge).
8. Write a program that instantiates two human objects.  This program should test to ensure that the human objects are created by calling a function from each one.
9. Write a function called “checkName” (outside of the class) that takes a human object as a parameter (passed by value) and prints the name of the object to the screen.
10. Write a function called “birthday” (outside of the class) that takes a human object as a parameter by reference and adds 1 year to the age of that object.
