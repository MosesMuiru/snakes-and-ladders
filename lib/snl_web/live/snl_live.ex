defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  alias Snl.Game.Play
  alias Snl.Bot

  def mount(_params, _session, socket) do

        Phoenix.PubSub.subscribe(Snl.PubSub, "playing")
  	new_socket =
  	socket
  	|> assign(die: 0)
  	|> assign(rand: Play.random_color())
        |> assign(btn_disable: false)

  	{:ok, new_socket}
  end

  def handle_event("roll", map, socket) do
  	die_roll = Play.roll_die()

  	new_socket =
  	socket
  	|> assign(die: die_roll)

  	{:reply, map, new_socket}
  end

  def handle_call(:bot_roll_die, {}, socket) do
    {:noreply, socket}
  end

end
