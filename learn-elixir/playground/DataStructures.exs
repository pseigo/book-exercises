defmodule DataStructures do
  defmodule Queue do

  end

  defmodule Stack do

  end

  defmodule LinkedList do

  end

  defmodule HashMap do

  end

  defmodule DirectedGraph do
    defstruct edges: %{} # atom --> list of atom

    def put_edge(%DirectedGraph{} = graph, from_vertex, to_vertex) when is_atom(from_vertex) and is_atom(to_vertex) do
      case graph.edges[from_vertex] do
        nil -> old_edges_from_vertex = []
        _notnil -> old_edges_from_vertex = graph.edges[from_vertex]
      end

      new_edges = Map.put(graph.edges, from_vertex, [to_vertex | old_edges_from_vertex ])
      %DirectedGraph{edges: new_edges}
    end


  end

  defmodule UndirectedGraph do

  end
end
