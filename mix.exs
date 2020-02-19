defmodule ScenicKeypad.MixProject do
  use Mix.Project

  @scenic_version "0.10"
  @github "https://github.com/BinaryNoggin/scenic_keypad"

  def project do
    [
      app: :scenic_keypad,
      version: "0.2.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      docs: [
        main: "Scenic.Keypad.Components"
      ],
      description: """
      Scenic.Keypad - Keypad component for Scenic
      """,
      package: [
        name: :scenic_keypad,
        contributors: ["Amos King"],
        maintainers: ["Amos King"],
        licenses: ["MIT"],
        links: %{github: @github}
      ],
      elixirc_options: [warnings_as_errors: true],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:scenic, "~> #{@scenic_version}"},
      {:ex_doc, ">= 0.0.0", only: [:dev, :docs]}
    ]
  end
end
