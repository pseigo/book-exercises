/***
 * A simple implementation of the Sieve of Eratosthenes algorithm	
 * to calculate all prime numbers within a given range.
 * 
 * @author Peyton Seigo
 */

package sieve;

import java.util.ArrayList;
import java.util.HashMap;

public class Main {

	public static void main(String[] args) {
	
		int upperBound = 200000;
		ArrayList<Integer> primes = primes(upperBound);
		
		for (int i : primes)
			System.out.println(i);
		
	}
	
	/**
	 *  Add numbers to map in the range [2, upperBound]. All numbers are
	 *  assumed to be prime and therefore are initialized to true.
	 */
	public static void fill(HashMap<Integer, Boolean> map, int upperBound) {
		for (int i = 2; i <= upperBound; ++i)
			map.put(i, true);
	}
	
	/**
	 * Calculate primes from [1, upperBound] using the Sieve of Eratosthenes.
	 * @param upperBound Maximum value for calculating prime numbers.
	 * @return ArrayList<Integer> with values of prime numbers up to maximum value.
	 */
	public static ArrayList<Integer> primes(int upperBound) {
		HashMap<Integer, Boolean> isPrime = new HashMap<Integer, Boolean>();
		fill(isPrime, upperBound);
		
		ArrayList<Integer> primes = new ArrayList<Integer>();
		primes.add(1); // 1 is assumed to be part of the set
		
		int i = 2;
		while (i*i <= upperBound) {	
			if (isPrime.get(i)) {
				primes.add(i);
				
				// factors of i starting at i*i are composite
				for (int j = i*i; j <= upperBound; j += i)
					isPrime.put(j, false);
			}
			++i;
		}
		
		// all remaining numbers that haven't been marked as composite are prime
		while (i <= upperBound) {
			if (isPrime.get(i))
				primes.add(i);
			++i;
		}
		
		return primes;
	}

}
