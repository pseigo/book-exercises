package etiquette;

public class Row {

	private boolean[] occupied;

	public Row(boolean[] occupied) {
		// this.occupied is a reference to the original object
		this.occupied = occupied;
	}

	public void println() {
		for (int i = 0; i != occupied.length; ++i)
			System.out.print(occupied[i] ? "# " : "O ");
		System.out.println();
	}

	public void println(char symbol, int index) {
		// print row
		for (int i = 0; i != occupied.length; ++i)
			System.out.print(occupied[i] ? "# " : "O ");
		System.out.println();

		// spaces for symbol
		for (int i = 0; i != (index + 1) * 2 - 2; ++i)
			System.out.print(" ");
		System.out.println(symbol);
	}

	/**
	 * Measures distance (in seats) from nearest occupied seat, relative
	 * to the front of the array. Does not account for seats relative to
	 * the back.
	 *
	 * @return An integer array where each element is the closest relative distance to an occupied seat.
	 */
	public int[] distFront() {

		final int SIZE = occupied.length;
		int dist = 0;
		boolean startsOccupied = occupied[0];
		int[] distFront = new int[SIZE];

		for (int i = 0; i != SIZE; ++i) {

			if (occupied[i]) {
				startsOccupied = true;
				dist = 0;
			} else {
				++dist;
			}


			if (startsOccupied)
				distFront[i] = dist;
			else // no occupied seat to start measuring from; NaN
				distFront[i] = Integer.MAX_VALUE;
		}

		return distFront;
	}

	/**
	 * Measures distance (in seats) from nearest occupied seat, relative
	 * to the back of the array. Does not account for seats relative to
	 * the front.
	 *
	 * @return An integer array where each element is the closest relative distance to an occupied seat.
	 */
	public int[] distBack() {

		final int SIZE = occupied.length;
		int dist = 0;
		boolean endsOccupied = occupied[SIZE - 1];
		int[] distBack = new int[SIZE];

		for (int i = SIZE-1; i >= 0; --i) {

			if (occupied[i]) {
				endsOccupied = true;
				dist = 0;
			} else {
				++dist;
			}

			if (endsOccupied)
				distBack[i] = dist;
			else // no occupied seat to start measuring from; NaN
				distBack[i] = Integer.MAX_VALUE;
		}

		return distBack;
	}

	/**
	 * Measures distance (in seats) from nearest occupied seat, relative
	 * to both directions in the array.
	 *
	 * @return An integer array where each element is the closest relative distance to an occupied seat.
	 */
	public int[] dist() {

		final int SIZE = occupied.length;
		int dist[] = new int[SIZE];
		int distBack[] = this.distBack();
		int distFront[] = this.distFront();

		for (int i = 0; i != SIZE; ++i)
			dist[i] = Math.min(distBack[i], distFront[i]);

		return dist;
	}

	/**
	 * @return ceil(arr.length / 2)
	 */
	private int getMid(boolean[] arr) {

		int size = arr.length;
		return (int)( Math.ceil((double)size / 2) );
	}

	public int getEndSeat() {

		// TODO replace with iterators?
		int start = 0,
			end = occupied.length - 1;

		for (int i = 0; i != getMid(occupied); ++i) {
			if (!occupied[start + i])
				return i;
			if (!occupied[end - i])
				return end - i;
		}

		// no available seats; error
		return -1;
	}

	/**
	 * Finds the first open seat farthest from occupied seats. Note that
	 * if more seats are found with the same distance as the previous
	 * maximum, only the first maximum's index will be used.
	 *
	 * @return Index of farthest seat.
	 */
	public int getFarthestSeat() {

		int[] dist = dist();
		int max = 0,
			maxIndex = 0;		// # of times max has been seen

		for (int i = 0; i != dist.length; ++i) {

			if (dist[i] > max) {
				max = dist[i];
				maxIndex = i;
			}
		}

		if (max == 1)
			maxIndex = getEndSeat();
		else if (max == 0)
			maxIndex = -1;

		return maxIndex;
	}
	
}
