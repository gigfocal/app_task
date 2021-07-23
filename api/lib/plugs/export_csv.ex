defmodule Api.ExportCsv do
  def write(tasks) do
    tasks
    |> Stream.map(&[&1.title, &1.status, &1.due_date])
    |> CSV.encode()
    |> Enum.into(File.stream!("tasks.csv"))
  end
end