defmodule SnlWeb.SnlLive do
  use SnlWeb, :live_view

  use GenServer
  alias Snl.Game.Play
  alias Snl.Bot

  def mount(_params, _session, socket) do
    IO.puts("this is the mount function")

        Phoenix.PubSub.subscribe(Snl.PubSub, "playing")
  	new_socket =
  	socket
  	|> assign(die: 0)
  	|> assign(rand: Play.random_color())

  	{:ok, new_socket}
  end

  def handle_event("roll", map, socket) do
  	die_roll = Play.roll_die()
        GenServer.call(Bot, :bot_roll_die)

  	new_socket =
  	socket
  	|> assign(die: die_roll)
        |> assign(human_played: true)

  	{:reply, map, new_socket}
  end

  def handle_info({:bot_roll, rolls}, socket) do
    
    IO.inspect(rolls)
    IO.puts("this")
    human_played = socket.assigns.human_played
    {:noreply, socket}
  end
end
