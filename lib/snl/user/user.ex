defmodule Snl.User do


  use Ecto.Schema
  import Ecto.Changeset
  alias Snl.GameRoom

  schema "users" do

    field :name, :string
    belongs_to :game_room, GameRoom

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name])
    |> validate_required(:name)
    |> unique_constraint([:name])

    
  end
end
