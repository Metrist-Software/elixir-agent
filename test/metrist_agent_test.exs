defmodule Metrist.AgentTest do
  use ExUnit.Case

  @port 51712

  setup_all do
    start_supervised!({Metrist.Agent, port: @port})
    :ok
  end

  setup do
    start_supervised!({UDPServer, port: @port, parent: self()})
    :ok
  end

  test "correct data received via udp" do
    {:ok, _response} = HTTPoison.get("https://google.com/test")

    assert_receive ["0", "GET", "google.com", "/test", _value]
  end

  test "handles no path" do
    {:ok, _response} = HTTPoison.get("https://google.com")

    assert_receive ["0", "GET", "google.com", "/", _value]
  end
end
