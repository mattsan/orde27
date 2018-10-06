defmodule Orde27.MixProject do
  use Mix.Project

  def project do
    [
      app: :orde27,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doukaku, github: "mattsan/ex_doukaku"}
    ]
  end
end
