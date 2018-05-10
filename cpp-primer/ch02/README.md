# Chapter 2 notes

## Data types

- `char` is guaranteed to be big enough to hold any character in the machine's **basic** character set.
- `wchar_t` is guaranteed to be big enough to hold any character in the machine's largest **extended** character set.
- `signed` types are evenly divided between negative and positive values (where 0 is part of the positive range).
  - An 8-bit `signed char` is guaranteed to hold values from -128 to 127.
- Assigning out-of-range values to unsigned types: result is remainder of `(value) % (number of vals the type can hold)`.
  - Therefore, assigning -1 to an unsigned 8-bit `unsigned char` gives that object the value 255.
- Assigning out-of-range values to signed types is undefined.
- Signed values are automatically converted to `unsigned` in an arithmetic expression with both an unsigned and a signed value

## Note about pointers and `constexpr` (67)

"It is important to understand that when we define a pointer in a `constexpr` declaration, the `constexpr` specifier applies to the pointer, not the type to which the pointer points. `constrexpr` imposes a **top-level `const`**:"

```c++
const int *p = nullptr;     // p is a pointer to a const int
constexpr int *q = nullptr; // q is a const pointer to int
```

## Declaration terminology

- Base type: `int`, `double`, `string`, etc.
- Type modifier: `*`, `&`

## Details on `const`

- 2.4/60: `const` variables in multiple files. _"To share a `const` object among multiple files, you must define the variable as `extern`."_

### Pointers, `const`, and Type Aliases (2.5.1/68)

The **const qualifier** modifies a given type:

```c+++
typedef char *pstring;
const pstring cstr = 0; // cstr is a constant pointer to char
const pstring *ps       // ps is a pointer to a constant pointer to char

// correct interpretation of const pstring cstr
char *const cstr = 0;

// wrong interpretation of const pstring cstr
const char *cstr = 0;
```

Here's an explanation broken down:

- The base type in these declarations is `const pstring`.
- The type of `pstring` is "pointer to `char`".
- Because `const` modifies a given type, it becomes a **constant pointer to `char`**.

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

## Best practices

- Use an `unsigned` type when you know that the values cannot be negative.
- Do not use plain `char` or `bool` in arithmetic expressions. if you need a tiny integer, expliticly use `signed char` or `unsigned char`. don't use `char` because its representation is NOT defined by the standard!
- 2.3.3/57 Style of Compound Type Declarations: Write **type modifiers** next to their variable, not the type they modify. (my opinion)
  - DO: `int *p1, *p2; // both p1 and p2 are pointers to int`
  - DON'T: `int* p1, p2; // p1 is a pointer to int, p2 is an int`
- 2.4.4/66 `constexpr` Variables: _"Generally, it is a good idea to use `constexpr` for variables that you intend to use as constant expressions."
- 3.2.2/88: "You can avoid problems  due to conversion between `unsigned` and `int` by not using `int`s in expressions that use `size()`."
  - In `n` is a negative integer, `s.size() < n` will almost surely evaluate to true. `n` will be implicitly converted to `unsigned` and wrap around to a very large positive number.

## Page references

- 32 | Table 2.1: C++ Arithmetic Types
- 40 | Table 2.2: Specifying the Type of a Literal
- 85 | Table 3.1: Ways to Initialize a `string`
  - Copy initialization & direct initialization
