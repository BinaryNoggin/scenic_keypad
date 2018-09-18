defmodule Scenic.Keypad.Components do
  @moduledoc """
  A set of helper functions to make it easy to add, or modify, keypads to a graph.

  The options available are the basic options for any component (ie. :scale, :translate, etc).
  Keypad also take a second options of `:buttons`. The `:buttons` option takes in the options
  from the core buttons component and applies that to each button in the keypad.

  The keypad events correspond to the keys pressed. All numbered keys send a tuple with `:keypad`
  and the number that was pressed (ie. `{:keypad, 1}`. Asterisk and pound send `{:keypad, :asterisk}`
  and `{:keypad, :pound}` respectively.


  # Examples

       graph
       |> keypad(translate: {40, 40}, scale: 2, buttons: [theme: :light])

       graph
       |> keypad(buttons: [theme: :dark])
  """

  alias Scenic.Graph
  alias Scenic.Keypad

  @spec keypad(Graph.t(), [...]) :: Graph.t()
  def keypad(%Graph{} = graph, options) do
    add_to_graph(graph, Keypad, nil, options)
  end

  defp add_to_graph(%Graph{} = g, mod, data, options) do
    mod.verify!(data)
    mod.add_to_graph(g, data, options)
  end
end
