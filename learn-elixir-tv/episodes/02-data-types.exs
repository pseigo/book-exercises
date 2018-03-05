defmodule Data do
    @doc """
    Strings are represented as binaries.
    """
    def strings do
        str_one = "Hello, World!"
        str_two = <<72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33>>
        str_one == str_two # => true
    end

    @doc """
    Maps are implemented as tuples.
    """
    def maps do
        person = %{
            name: "Peyton Seigo", # key is an atom, :name
            "age": 18             # key is a string, "age"
        }

        person.name # => "Peyton Seigo"
        person[:name] # => "Peyton Seigo"
        person["age"] # => 18
    end

    @doc """
    Tuples are contiguous and not resizeable (just like arrays).
    """
    def tuples do
        person = {"Peyton", 17}

        # Accessing
        elem(person, 0) # => "Peyton"
        elem(person, 1) # => 17

        # Updating elements
        put_elem(peyton, 1, 18) # person == {"Peyton", 18}
    end

    @doc """
    Implemented as a linked list, where each node is immutable.
    """
    def lists do
        list_one = [1, 2, 3]

        # Prepending elements. points a new list [12] to the start of ages_one, O(1)
        list_two = [0 | list_one]
        # => [0, 1, 2, 3]

        # Appending elements. copies the entire original list (VERY SLOW, O(n))
        list_two = list_one ++ [4]
        # => [1, 2, 3, 4]

        # Inserting elements. Copies beginning of list, points to existing end of list.
        list_two = List.insert_at(list_one, 1, 1.5)
        # => [1, 1.5, 2, 3]
    end

    @doc """
    Alternate for strings.

    ## Note
    Unless working with an Erlang library, use Binaries instead!
    """
    def char_lists do
        # Shorthand notation
        'hello'

        # Under the hood
        [104, 101, 108, 108, 111]
    end

    def functions do
        # Anonymous functions
        add = fun(a, b) ->
                a + b
            end

        add.(1, 2) # => 3
    end

    @doc """
    See the Kernel module docs for a complete list of type-checking functions.
    """
    def type_checking do
        is_atom(:hello)     # => true
        is_list([1, 2, 3])  # => true
        is_map(%{...})      # => true
    end

    # High level types
    @doc """
    Implemented a list of tuples where elem 1 is an :atom and elem 2 is the data.
    Similar to maps, but implemented differently.
    """
    def keyword_lists do
        # Shorthand notation
        attrs = [name: "Peyton Seigo",
                email: "peyton@google.ca"]

        # Under the hood
        [{:name, "Peyton Seigo"},
         {:email, "peyton@google.ca"}]

        # Accessing values in a keyword list by their label
        attrs[:name] # => "Peyton Seigo"
        attrs[:email] # => "peyton@google.ca"
    end

    @doc """
    Structs (similar to Java objects), are implemented as maps.
    """
    def structs do
        %{__struct__: ModuleName, ...}

        # Shorthand notation
        %Person{
            name: "Peyton Seigo",
            age: 18
        }

        # Under the hood
        %{
            __struct__: Person,
            name: "Peyton Seigo",
            age: 18
        }
    end

    @doc """
    Collection of numbers from a range to a max.
    """
    def ranges do
        # Shorthand notation
        0..100

        # Under the hood
        %Range{
            first: 0,
            last: 100
        }
    end

    def regular_expressions do
        # Shorthand notation
        ~r/hello/

        # Under the hood
        %Regex{
            opts: "",
            re_pattern: {:re_pattern, <<69, 82, 67, 80, 81, 0, ..>>},
            source: "hello"
        }
    end
end
