defmodule CollegeSpec.Repo.Migrations.CreateCollege do
  use Ecto.Migration

  def change do
    create table(:colleges) do
      add :name, :string
      add :address, :string

      timestamps()
    end

  end
end
