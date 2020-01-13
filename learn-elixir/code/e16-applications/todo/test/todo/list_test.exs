defmodule Todo.ListTest do
  use ExUnit.Case

  alias Todo.List
  alias Todo.Item

  _ = """
  # Context
  
  If setup_all or setup return a keyword list, a map, or {:ok, keywords | map}, the keyword list or map will be merged into the current context and will be available in all subsequent setup_all, setup, and the test itself.
  
  Returning :ok leaves the context unchanged (in setup and setup_all callbacks).
  
  Returning anything else from setup_all will force all tests to fail, while a bad response from setup causes the current test to fail.

  @see https://hexdocs.pm/ex_unit/ExUnit.Case.html#module-context
  @see https://hexdocs.pm/ex_unit/ExUnit.Callbacks.html#module-context
  """
  setup do
    {:ok, list} = List.start_link("Home")
    {:ok, list: list}
  end

  _ = """
  # Test Context

  `context` is a map including any key-value pairs returned in in `setup` as well as some other information, including

  - test file path
  - current test name
  - line number of this test
  - if being run asynchronously

  and a few other things.
  """
  test ".items returns todos in the list", context do
    assert List.items(context.list) == []
  end

  test ".add adds an item to the list", %{list: list} do
    item = Item.new("Create an OTP app")
    List.add(list, item) 

    assert List.items(list) == [item]
  end

  test ".add adds multiple items to the list", %{list: list} do
    item1 = Item.new("Create an OTP app")
    item2 = Item.new("Another to-do")
    item3 = Item.complete(Item.new("Something else"))
    List.add(list, item1) 

    assert List.items(list) == [item1]

    List.add(list, item2) 
    List.add(list, item3) 
    result = List.items(list)

    assert item1 in result
    assert item2 in result
    assert item3 in result
  end

  test ".update can mark an item complete", %{list: list} do
    item_orig = Item.new("Complete an item")
    List.add(list, item_orig)
    
    assert item_orig in List.items(list)

    item_updated = %{item_orig | complete: true, description: "Completed!"}
    List.update(list, item_updated)

    assert item_orig not in List.items(list)
    assert item_updated in List.items(list)
  end

  test ".update with an ID not in list adds the item", %{list: list} do
    item = Item.new("Complete an item")
    assert item not in List.items(list)

    List.update(list, item)
    assert item in List.items(list)
  end
end
