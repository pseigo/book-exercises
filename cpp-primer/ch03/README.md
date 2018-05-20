# Chapter 3 notes

## Reading into a `string`

- `is >> s`: Reads whitespace-separated string from `is` into `s`. Returns `is`.
- `getline(is, s)`: Reads a line of input from `is` into `s`. Returns `is`.
  - `s` must be a `string`.
  - Does not ignore whitespace.
  - Reads up to (not including) the first newline `\n` character or EOF (end-of-file) or invalid input.

## Ways to use `string::size_type`

```c++
string str = "Hello, World!";

// Using the type that str.size() returns
auto size1 = str.size();

// Explicitly using the type
string::size_type size2 = str.size();

// Using a synonym for the explicit type
typedef string::size_type str_sz;
str_sz size3 = str.size();

// Using the type that str.size() returns
decltype(str.size()) size4 = str.size();
```

## Iterators to capitalize a string

Example from 3.4.1/107:

```c++
string s("some string");

if (s.begin() != s.end())/ {    // make sure `s` is not empty
    auto it = s.begin();        // `it` denotes the first character in `s`
    *it = toupper(*it);         // make that character uppercase
}
```

##  `const_iterator`

```c++
vector<int>::iterator it; // `it` can read and write `vector<int>` elements
string::iterator it2; // `it2` can read and write characters in a `string`

vector<int>::const_iterator it3;  // `it3` can read but not write elements
string::const_iterator it4;       // `it4` can read but not write characters
```

"A `const_iterator` behaves like a pointer to `const` (2.4.2/62). Like a pointer to `const`, a `const_iterator` may read but not write the element it denotes; an object of type `iterator` can  both read and write.

**If a `vector` or `string` is `const`, we may use only its `const_iterator` type.** WIth a con`const` `vector` or `string`, we can use either `iterator` or `const_iterator`." (3.4.1/108)

Because `begin` and `end` return an interator based on whether the collecton's elements are `const`, C++11 introduced two functions named **`cbegin` and `cend`**. They ALWAYS return a `const_iterator`.

## Best practices

- 3.2.2/88: "You can avoid problems  due to conversion between `unsigned` and `int` by **not using `int`s in expressions that use `size()`.**"
  - In `n` is a negative integer, `s.size() < n` will almost surely evaluate to true. `n` will be implicitly converted to `unsigned` and wrap around to a very large positive number.
- 3.3.3/105: "A good way to ensure that subscripts are in range is to **avoid subscripting altogether by using a range `for` whenever possible.**"
  - _"Attempting to subscript elements that do not exist is, unfortunately, an extremely common and pernicious programming error."_
- 3.4.1/109: "... it is usually best to **use a `const` type** (such as `const_iterator`) **when we need to read but do not need to write to an object.**"
- 3.4.1/110 Some `vector` operations invalidate iterators: "For now, it is important to realize that **loops that use iterators should NOT add elements to the container to which the iterators refer.**"

## Page references

- 85 | Table 3.1: Ways to Initialize a `string`
  - Copy initialization & direct initialization
- 111 Iterator arithmetic | Table 3.7: Operations Supported by `vector` and `string` Iterators
