# Notes
I've written this in the past (3 months ago) [using C++](https://github.com/pseigo/prime-numbers) but it wasn't very readable and I'm sure it was less efficient. I've gone back and rewritten it using the same approach as in this assignment.

**Khan Academy**
I used Khan Academy's great video on the [Sieve of Eratosthenes](https://www.khanacademy.org/video/sieve-of-eratosthenes-prime-adventure-part-4) to understand the algorithm.
[![Sieve of Eratosthenes](https://img.youtube.com/vi/klcIklsWzrY/0.jpg)](https://www.khanacademy.org/computing/computer-science/cryptography/comp-number-theory/v/sieve-of-eratosthenes-prime-adventure-part-4)

I've definitely been mispronouncing Eratosthenes this whole time.

# Instructions
The Sieve of Eratosthenes is a mathematical process used to find prime numbers. It works by taking a list of numbers that are sequential from 2 to an upper limit n. It starts by taking the first number in the list and eliminating all of the remaining numbers in the list that are evenly divisible by that number. This would eliminate all of the even numbers. It then takes the next number that has not been eliminated and eliminates any number following it that is evenly divisible. After doing this for all the remaining numbers in the list, the remaining numbers must be prime numbers.

Assignment: Write an algorithm that uses the Sieve of Eratosthenes to find all of the prime numbers from 1 to 200,000.
