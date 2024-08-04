defmodule Snl.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :game_room_id, references(:game_rooms)

      timestamps()
    end

    unique_index("users", [:name])

  end
end
