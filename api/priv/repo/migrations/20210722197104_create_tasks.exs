defmodule Api.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :due_date, :utc_datetime_usec
      add :category_id, references(:categories, on_delete: :nilify_all, type: :uuid)
      timestamps()
    end
    create index(:tasks, [:category_id])
    execute "ALTER TABLE tasks
      ADD status ENUM('todo', 'progress', 'done');"
  end
end
