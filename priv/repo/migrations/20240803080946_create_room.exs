defmodule Snl.Repo.Migrations.CreateRoom do
  use Ecto.Migration

  def change do
    create table (:game_rooms) do
      add :room_unique_id, :integer
      add :name, :string

      timestamps()
    end

    unique_index("game_rooms", [:room_unique_id, :name], unique: true)
  end
end
