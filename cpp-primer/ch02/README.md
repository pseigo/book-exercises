# Chapter 2 notes

## Notes

- `char` is guaranteed to be big enough to hold any character in the machine's **basic** character set.
- `wchar_t` is guaranteed to be big enough to hold any character in the machine's largtst **extended** character set.
- `signed` types are evenly divided between negative and positive values (where 0 is part of the positive range).
  - an 8-bit `signed char` is guaranteed to hold values from -128 to 127.
- assigning out-of-range values to unsigned types: result is remainder of `(value) % (number of vals the type can hold)`.
  - therefore, assigning -1 to an unsigned 8-bit `unsigned char` gives that object the value 255.
- assigning out-of-range values to signed types is undefined.
- signed values are automatically converted to `unsigned` in an arithmetic expression with both an unsigned and a signed value

### Best practices

- use an `unsigned` type when you know that the values cannot be negative.
- do not use plain `char` or `bool` in arithmetic expressions. if you need a tiny integer, expliticly use `signed char` or `unsigned char`. don't use `char` because its representation is NOT defined by the standard!

## Page references

- 32 | Table 2.1: C++ Arithmetic Types
- 40 | Table 2.2: Specifying the Type of a Literal
