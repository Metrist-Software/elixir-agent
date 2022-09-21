defmodule Metrist.Agent.MixProject do
  use Mix.Project

  def project do
    [
      app: :metrist_agent,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "Metrist Agent"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:hackney, "~> 1.18"},
      {:jason, "~> 1.2"},
      {:httpoison, "~> 1.8", only: [:test]}
    ]
  end

  defp description do
    "Metrist In-Process Agent for the BEAM ecosystem (Erlang, Elixir). This agent will forward timings of intercepted calls to the Metrist Monitoring Agent for further processing."
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README* readme* LICENSE* license*),
      licenses: ["Apache-2.0"],
    ]
  end
end
