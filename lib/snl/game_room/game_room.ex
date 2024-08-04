defmodule Snl.GameRoom do

  use Ecto.Schema
  import Ecto.Changeset

  schema "game_rooms" do

    field :room_unique_id, :integer
    field :name, :string

    has_many :users, Snl.User

    timestamps()
  end

  # room_id should should be a number
  # you can name your room to any name
  def changeset(room, params) do
    room
    |> cast(params, [:room_unique_id, :name])
    |> validate_required([:name, :room_unique_id])
    |> unique_constraint([:room_unique_id, :name])

  end
end
