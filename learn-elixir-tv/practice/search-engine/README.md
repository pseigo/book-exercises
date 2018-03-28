# Search engine program

When you search a term on a search engine such as Google, it recommends related terms. For example, searching "elixir otp" will bring up several related terms:

- elixir otp **tutorial**
- elixir otp **book**
- elixir otp **application**
- elixir otp **example**
- elixir otp **app**

In order to make sure users find the information they want, it is important to recommend the most popular related search terms first.

## High level implementation

You will write a function `sort_related_terms/1` which takes a `list`. See _Given data_ for what this list looks like.

You must write this assignment as a Mix project, complete with ExUnit tests.

## Given data

You are GIVEN the number of hits for each search term for each day. This data organized in a tuple:

`{"search term", [10, 100, 97, 103, ...]}`

The first element in the tuple is the search term as a `string`. The second element is a `list` where the first element is the number of hits today, the second element was the number of hits yesterday, etc.

Each term is given in this format and put into a list. For example:

```elixir
[
  {"related rates calculator", [500, 1000, 950, ...]},
  {"related rates problems", [400, 1200, 600, ...]},
  {"related rates khan academy", [200, 450, 850, ...]},
  ...
]
```

## Scoring a search term

An overall score can be calculated for a search term according to the series:

![\sum_{n = 0}^{\infty} \left ( list[n] \cdot \frac{1}{\sqrt{n+1}} \right )](eqn_series.png)

_`n`_ is the index/day. `list` is the hits by day, the second element in the tuple.

Calculate this score for each search term. **Only consider the last 10 days of hit history for each related search term.**

## Sorting the search terms

Return a `list` of tuples in the form `{"search term", score}` and sorted in non-ascending order. Example:

```elixir
[
  {"apple watch", 100},
  {"apple pie", 95},
  {"apples or oranges", 10}
]
```

> **Understanding:** _"non-ascending order"_
>
> - Descending: `t(n) < t(n-1)`
> - Non-ascending: `t(n) <= t(n-1)`
>
> When a list is sorted in _descending_ order, each element is smaller than the last. This does not account for cases when two elements are the **same**.
>
> If the following is true for a list in ascending order: `t(n) > t(n-1)`, then NON-ascending order must cover the opposite domain, therefore including: `t(n) <= t(n-1)`.


## Printing the search terms

In addition, write a function `print_search_terms/2` that will print the related search terms. See the sample output:

```
term
term related 1
term related 2
term related 3
...
```

The first argument is the original search term as a `string`. The second argument is a list of tuples where each tuple is `{"search term", score}`.

The list should be the result of `sort_related_terms/1`.

## The data

Here's the actual data you will use. Copy and paste the following code into iex for easy testing.

```elixir
term = "albert camus"

data = [
  {"albert camus quotes", [631, 939, 997, 678, 864, 689, 445, 770, 750, 616]},
  {"albert camus the stranger", [806, 621, 487, 909, 580, 550, 700, 898, 735, 576]},
  {"albert camus books", [1340, 1104, 968, 866, 930, 511, 654, 902, 758, 860]},
  {"albert camus the plague", [724, 535, 746, 871, 484, 851, 662, 547, 423, 617]},
  {"albert camus biography", [925, 946, 882, 536, 535, 995, 647, 501, 692, 982]},
  {"albert camus sisyphus", [452, 943, 645, 604, 821, 483, 435, 963, 908, 911]},
  {"albert camus philosophy", [928, 860, 799, 842, 995, 969, 472, 638, 681, 969]},
  {"albert camus nobel prize", [881, 766, 989, 775, 716, 846, 879, 682, 942, 862]},
  {"albert camus photos", [143, 318, 128, 221, 80, 203, 400, 758, 1598, 2304]},
  {"albert camus the outsider", [678, 888, 421, 869, 411, 593, 619, 874, 453, 696]}
]
```
