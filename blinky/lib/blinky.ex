defmodule Blinky do
  require Logger
  @on_duration  500
  @off_duration 500

  def blink() do
    ledpin = 14
    IO.puts "Starting pin #{ledpin} as output"
    {:ok, pin} = Gpio.start_link(ledpin, :output)

    spawn fn -> blink_led_forever(pin) end
  end

  defp blink_led_forever(pin) do
    IO.puts "Blink!"
    Gpio.write(pin, 1)
    :timer.sleep(@on_duration)
    Gpio.write(pin, 0)
    :timer.sleep(@off_duration)

    blink_led_forever(pin)
  end
end
