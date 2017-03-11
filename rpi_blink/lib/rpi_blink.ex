defmodule RpiBlink do
  require Logger

  @on_duration  200
  @off_duration 200

  def blink() do
    led = Application.get_env(:rpi_blink, :led)
    Logger.debug "list of leds to blink is #{inspect led}"
    spawn fn -> blink_led_forever(led) end
  end

  defp blink_led_forever(pin) do
    IO.puts "Blink!"
    Nerves.Leds.set [{pin, true}]
    :timer.sleep(@on_duration)
    Nerves.Leds.set [{pin, false}]
    :timer.sleep(@off_duration)

    blink_led_forever(pin)
  end
end
