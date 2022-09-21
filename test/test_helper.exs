defmodule UDPServer do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(opts) do
    {:ok, socket} =
      opts
      |> Keyword.get(:port, 51712)
      |> :gen_udp.open([:binary, active: true])
    {:ok,
     %{
       socket: socket,
       parent: Keyword.get(opts, :parent)
     }}
  end

  def handle_info({:udp, _socket, _address, _port, data}, state) do
    send(state.parent, String.split(data, ~r/[[:space:]]+/))

    {:stop, :done, nil}
  end
end

ExUnit.start()
