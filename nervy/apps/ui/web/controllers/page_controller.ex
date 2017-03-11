defmodule Ui.PageController do
  use Ui.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def on(conn, _params) do
    Fw.Application.turn_on()
    text conn, "Turning On"
  end

  def off(conn, _params) do
    Fw.Application.turn_off()
    text conn, "Turning Off"
  end
end
