defmodule Fw.Application do
  use Application
  require Logger
  @ledpin Application.get_env(:temperature, :ledpin)[:pin]

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(Task, [fn -> Nerves.Networking.setup :eth0, [mode: "static", address: "192.168.70.254",
      router: "192.168.70.1", mask: "255.255.255.0"] end], restart: :transient)
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fw.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def turn_on() do
    {:ok, pin} = Gpio.start_link(@ledpin, :output)
    Gpio.write(pin, 1)
    IO.puts("On!")
  end

  def turn_off() do
    {:ok, pin} = Gpio.start_link(@ledpin, :output)
    Gpio.write(pin, 0)
    IO.puts("Off!")
  end
end
