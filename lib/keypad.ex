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
            "2" => [id: 2, t: {50, 0}],
            "3" => [id: 3, t: {100, 0}],
            "4" => [id: 4, t: {0, 40}],
            "5" => [id: 5, t: {50, 40}],
            "6" => [id: 6, t: {100, 40}],
            "7" => [id: 7, t: {0, 80}],
            "8" => [id: 8, t: {50, 80}],
            "9" => [id: 9, t: {100, 80}],
            "*" => [id: :asterisk, t: {0, 120}, width: 41],
            "0" => [id: 0, t: {50, 120}],
            "#" => [id: :pound, t: {100, 120}]
          }
          |> Enum.reduce(g, fn
            {name, key_options}, graph ->
              options = Keyword.merge(button_opts, key_options)
              button(graph, name, options)
          end)
        end,
        opts
      )

    {:ok, graph, push: graph}
  end

  def filter_event({:click, button}, _, graph) do
    send_event({:keypad, button})
    {:halt, graph}
  end
end
