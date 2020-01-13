defmodule DataStructures.BinaryTree do
  @moduledoc """
  A binary tree data structure.

  ## Implementation
  
  Nodes are stored in a map keyed by an index which gives us logarithmic
  time operations, as opposed to using a list which takes linear time for
  accesses.

  Each index maps to a tuple of the form `{search_key, value}` such that
  `search_key` is the value used in preserving the tree's ordering
  property, and `value` is any data stored in that node.

  The root node is stored at key 1. If a node's index is `i`, its left
  child is stored at `2i` and its right child is stored at `2i + 1`.

  We use an `Agent` to manage state. This module returns the pid of the
  associated `Agent` and thus the client is responsible for passing this
  along to `BinaryTree` helper functions.

  ### Example

  The tree

  ```
          5
         / \\
        4   7
       /   / \\
      3   6   8
  ```

  would be represented as

  ```elixir
  %{1 => {5, ...},
    2 => {4, ...},
    3 => {7, ...},
    4 => {3, ...},
    6 => {6, ...},
    7 => {8, ...}}
  ```
  """

  @spec start_link() :: {:ok, pid()}  
  def start_link() do
    Agent.start_link(fn -> %{} end)
  end

  @spec get_at_index(pid(), non_neg_integer()) :: {any(), any()} | {nil, nil}
  defp get_at_index(tree, index) do
    Agent.get(tree, &(Map.get(&1, index, {nil, nil})))
  end

  defp left_index(index), do: index * 2
  defp right_index(index), do: index * 2 + 1

  @spec get(pid(), any()) :: any() | nil
  def get(tree, search_key) when is_pid(tree) do
    do_get(tree, search_key, 1)
  end

  @spec do_get(pid(), any(), non_neg_integer()) :: any() | nil
  defp do_get(tree, search_key, curr_index) when is_pid(tree) and is_integer(curr_index) do
    {curr_search_key, curr_data} = get_at_index(tree, curr_index) 
    cond do
      curr_data  == nil             -> nil
      search_key == curr_search_key -> curr_data
      search_key <  curr_search_key -> do_get(tree, search_key, left_index(curr_index))
      search_key >  curr_search_key -> do_get(tree, search_key, right_index(curr_index))
    end
  end

  @spec insert(pid(), any(), any()) :: :ok 
  def insert(tree, search_key, value) when is_pid(tree) do
    do_insert(tree, search_key, value, 1)
  end

  @spec do_insert(pid(), any(), any(), non_neg_integer()) :: :ok 
  defp do_insert(tree, search_key, value, curr_index) when is_pid(tree) do
    {curr_search_key, curr_data} = get_at_index(tree, curr_index) 
    cond do
      curr_data  == nil             -> Agent.update(tree, &(Map.put(&1, curr_index, {search_key, value})))
      search_key <= curr_search_key -> do_insert(tree, search_key, value, left_index(curr_index))
      search_key >  curr_search_key -> do_insert(tree, search_key, value, right_index(curr_index))
    end
  end

  @spec foreach_preorder(pid(), function()) :: :ok
  def foreach_preorder(tree, fun) when is_pid(tree) and is_function(fun) do
    do_foreach_preorder(tree, fun, 1)
    :ok
  end

  # TODO: should allow data to be `nil` (because I'm currently using `nil` to mean the node DNE)

  @spec do_foreach_preorder(pid(), function(), non_neg_integer()) :: :ok
  defp do_foreach_preorder(tree, fun, index) when is_pid(tree) and is_function(fun) do
    {curr_search_key, curr_data} = get_at_index(tree, index) 
    unless curr_search_key == nil and curr_data == nil do
      fun.(curr_search_key, curr_data)
      do_foreach_preorder(tree, fun, left_index(index))
      do_foreach_preorder(tree, fun, right_index(index))
    end
  end

  @spec foreach_inorder(pid(), function()) :: :ok
  def foreach_inorder(tree, fun) when is_pid(tree) and is_function(fun) do
    do_foreach_inorder(tree, fun, 1)
    :ok
  end

  @spec do_foreach_inorder(pid(), function(), non_neg_integer()) :: :ok
  defp do_foreach_inorder(tree, fun, index) when is_pid(tree) and is_function(fun) do
    {curr_search_key, curr_data} = get_at_index(tree, index) 
    unless curr_search_key == nil and curr_data == nil do
      do_foreach_inorder(tree, fun, left_index(index))
      fun.(curr_search_key, curr_data)
      do_foreach_inorder(tree, fun, right_index(index))
    end
  end

  @spec foreach_postorder(pid(), function()) :: :ok
  def foreach_postorder(tree, fun) when is_pid(tree) and is_function(fun) do
    do_foreach_postorder(tree, fun, 1)
    :ok
  end

  @spec do_foreach_postorder(pid(), function(), non_neg_integer()) :: :ok
  defp do_foreach_postorder(tree, fun, index) when is_pid(tree) and is_function(fun) do
    {curr_search_key, curr_data} = get_at_index(tree, index) 
    unless curr_search_key == nil and curr_data == nil do
      do_foreach_postorder(tree, fun, left_index(index))
      do_foreach_postorder(tree, fun, right_index(index))
      fun.(curr_search_key, curr_data)
    end
  end

end
