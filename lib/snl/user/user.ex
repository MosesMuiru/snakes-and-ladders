defmodule Snl.User do


  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do

    field :name, :string

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name])
    |> validate_required(:name)

    
  end
end
