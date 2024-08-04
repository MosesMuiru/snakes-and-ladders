defmodule Snl.BotTest do
  use ExUnit.Case
  alias Snl.Bot

  setup do

    {:ok, pid} =  Bot.start_link()
    {:ok, pid: pid}

  end

  test "test bot rolling die --> returns a random interger as state" do


  end

end
