defmodule Snl.Bot do


  use GenServer
  alias Snl.Game.Play

  def start_link do
    times_played = 0;
    GenServer.start_link(__MODULE__, times_played, name: __MODULE__) 
  end

  # i need to maintain the state
  def bot_roll_die(pid) do
    GenServer.call(pid, :bot_roll_die)
  end

  #server
  def init(times_played) do
    {:ok, times_played}
  end

  def handle_call(:bot_roll_die, _from, times_played) do
    roll_state = Play.roll_die() 
    {:reply, roll_state, times_played+1}
  end

end
