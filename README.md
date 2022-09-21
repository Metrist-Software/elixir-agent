# MetristAgent

Metrist In-Process Agent for the BEAM ecosystem (Erlang, Elixir). This agent will
forward timings of intercepted calls to the Metrist Monitoring Agent for further
processing.

Interception is currently only implemented for Hackney, which comes with a tracing
library. This means that libraries that use Hackney, like HTTPoison, will
automatically work.

To use the agent, simply add this module to your application's supervision tree.

## Installation

1. Add `metrist_agent` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:metrist_agent, "~> 0.1.0"}]
end
```

2. Fetch mix dependencies:

```bash
$ mix deps.get
```

3. Add `Metrist.Agent` to your application's supervision tree in `application.ex`:

```elixir
def start(_type, _args) do
  children = [
    Metrist.Agent,
  ]

  ...
```
This will start the Metrist Agent and hook into hackney to begin listening for network requests.
