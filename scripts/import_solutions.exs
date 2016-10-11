File.read!("./data/solutions.txt")
|> String.split("\n")
|> Enum.filter( &(&1 != "") )
|> Enum.map(fn (row) ->
  row
  |> String.split(" ")
end)
|> Enum.map(&(
  %{
    number: &1 |> Enum.at(0) |> String.to_integer,
    solution: &1 |> Enum.at(1)
  }
))
|> Enum.each(fn (problem) ->
  %Euler.Problem{}
  |> Euler.Problem.changeset(problem)
  |> Euler.Repo.insert
  |> IO.inspect
end)
