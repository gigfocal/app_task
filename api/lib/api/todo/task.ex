defmodule Api.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tasks" do
    field :title, :string
    field :due_date, :utc_datetime_usec
    field :done, :boolean, default: false
    belongs_to :category, Api.Todo.Category
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :due_date, :done])
    |> validate_required([:title, :due_date, :done])
  end
end
