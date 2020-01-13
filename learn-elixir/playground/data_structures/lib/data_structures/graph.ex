defmodule DataStructures.Graph do
  @moduledoc """
  A graph implemented using an adjacency map. In particular, this
  module maintains a map such that each key uniquely represents
  some vertex. Each key maps to a tuple containing data for the
  vertex and a list of keys for other vertices.

  Allows multi-edges -- multiple edges in a graph with the same
  origin and destination.

  ## Representation Example 
  
  %{"A" => {_dataA, ["B", "C"]},
    "B" => {_dataB, ["A", "C"]},
    "C" => {_dataC, []}} 

  This implementation has reasonable runtimes for insertion,
  removal, and iteration compared to alternative implementations.

  | Iterate over all vertices | `foreach_vertex`
  | Iterate over all edges | `foreach_edge` 
  | Iterate over vertices adjacent to some vertex | `foreach_adjacent
  | Edge exists? |
  | Degree of vertex, `v` | Θ(deg(v))

  Get all vertices
  get all edges
  Get all vertices adjacent to some vertex
  Check if edge exists
  Insert vertex
  Remove vertex
  Adjacent?(v, w)
  InsertEdge
  RemoveEdge
  """

  @typedoc """
  A pid of a process maintaining the state of some graph. Behaviour is undefined
  if the user decides to modify the state directly.
  """
  @type graph() :: pid()

  @spec start_link() :: Agent.on_start()
  def start_link(), do: Agent.start_link(fn -> %{} end)

  @doc """
  Creates a graph, inserting `vertices` and `edges` such that a vertex is
  described as `{label, data}` and an edge as `{from_label, to_label}`.
  """
  @spec start_link(list(), list()) :: Agent.on_start() 
  def start_link(vertices, edges) when is_list(vertices) and is_list(edges) do
    {:ok, pid} = start_link()
    Enum.each(vertices, &(put_vertex(pid, elem(&1, 0), elem(&1, 1))))
    Enum.each(edges, &(put_edge(pid, elem(&1, 0), elem(&1, 1))))
    {:ok, pid}
  end

  @doc """
  Puts the given `data` with an empty adjacency list under `label` in `graph`. 

  **Note**: This WILL overwrite an existing vertex's adjacency list. Use
  `put_new_vertex/3` if you do not want to modify existing vertices.
  """
  @spec put_vertex(graph(), any(), any()) :: :ok
  def put_vertex(graph, label, data) do
    Agent.update(graph, &(Map.put(&1, label, {data, []})))
  end

  @doc """
  Puts the given `data` with an empty adjacency list under `label` in `graph`
  only if a vertex with `label` does not exist.
  """
  @spec put_new_vertex(graph(), any(), any()) :: :ok
  def put_new_vertex(graph, label, data) do
    Agent.update(graph, &(Map.put_new(&1, label, {data, []})))
  end

  @doc """
  Puts edge in `graph` directed from `from_vertex` to `to_vertex`. Allows
  multi-edges.

  If `from_vertex` does not exist in `graph`, will create such a vertex and
  add the edge. Use `put_edge!/3` if you do not want this behaviour.
  """
  @spec put_edge(graph(), any(), any()) :: :ok
  def put_edge(graph, from_vertex, to_vertex) do
    Agent.update(graph, fn(state) -> 
      Map.update(
        state,
        from_vertex,
        [to_vertex], # TODO: need to add data too! but what's the default? maybe set a default when creating?
        &(put_elem(&1, 1, [to_vertex | elem(&1, 1)]))
      )
    end)
  end

  @doc """
  Puts edge in `graph` directed from `from_vertex` to `to_vertex`. Allows
  multi-edges.

  If `from_vertex` does not exist in `graph`, a `KeyError` exception is raised.
  """
  @spec put_edge!(graph(), any(), any()) :: :ok
  def put_edge!(graph, from_vertex, to_vertex) do
    Agent.update(graph, fn(state) -> 
      Map.update!(
        state,
        from_vertex,
        &(put_elem(&1, 1, [to_vertex | elem(&1, 1)]))
      )
    end)
  end
end
