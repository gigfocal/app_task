defmodule ApiWeb.Todo.TaskController do
  use ApiWeb, :controller

  alias Api.Todo
  alias Api.Todo.Task

  action_fallback ApiWeb.FallbackController

  def index(conn, %{"action" => "export"})do

  end



  def index(conn, params) do
    IO.inspect params
    tasks = Todo.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn,  %{"file" => %Plug.Upload{path: path}})do
    imports = ImportCsv.import(path)
    tasks = Todo.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Todo.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Todo.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Todo.get_task!(id)

    with {:ok, %Task{} = task} <- Todo.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Todo.get_task!(id)

    with {:ok, %Task{}} <- Todo.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
