defmodule Scenic.Keypad do
  @moduledoc """
  A Keypad Scenic Component
  """

  use Scenic.Component
  alias Scenic.Graph
  import Scenic.Primitives
  import Scenic.Components

  def verify(nil), do: {:ok, nil}
  def verify(_), do: :invalid_data

  def init(_, opts) do
    button_opts = Keyword.get(opts, :styles) |> Map.get(:buttons, [])

    graph =
      Graph.build(font: :roboto, font_size: 80)
      |> group(
        fn g ->
          %{
            "1" => [id: 1, t: {0, 0}],
            "2" => [id: 2, t: {90, 0}],
            "3" => [id: 3, t: {180, 0}],
            "4" => [id: 4, t: {0, 40}],
            "5" => [id: 5, t: {90, 40}],
            "6" => [id: 6, t: {180, 40}],
            "7" => [id: 7, t: {0, 80}],
            "8" => [id: 8, t: {90, 80}],
            "9" => [id: 9, t: {180, 80}],
            "*" => [id: :asterisk, t: {0, 120}],
            "0" => [id: 0, t: {90, 120}],
            "#" => [id: :pound, t: {180, 120}]
          }
          |> Enum.reduce(g, fn
            {name, key_options}, graph ->
              options = Keyword.merge(button_opts, key_options) |> IO.inspect()
              button(graph, name, options)
          end)
        end,
        opts
      )
      |> push_graph()

    {:ok, graph}
  end

  def filter_event({:click, button}, _, graph) do
    send_event({:keypad, button})
    {:stop, graph}
  end
end
