defmodule ImportCsv do
  def import(file) do
    file
    |> File.stream!
    |> CSV.decode
    |> Enum.take(200_000)
    |> imports_to_tasks()
  end

  def imports_to_tasks(imports)do
    imports
    |> Enum.each(
         fn
           {:ok, [title, status, due_date]} -> Api.Todo.create_task(%{title: title, status: status, due_date: due_date})
         end
       )
  end

end