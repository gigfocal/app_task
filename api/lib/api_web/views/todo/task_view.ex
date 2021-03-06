defmodule ApiWeb.Todo.TaskView do
  use ApiWeb, :view
  alias ApiWeb.Todo.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{tasks: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{task: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{
      id: task.id,
      status: task.status,
      due_date: task.due_date,
      title: task.title,
      inserted_at: task.inserted_at,
      updated_at: task.updated_at
    }
  end
end
