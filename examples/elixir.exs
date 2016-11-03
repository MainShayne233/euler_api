# requires HTTPotion and Poison to be dependencies in your mix.exs file

"https://projecteulerapi.herokuapp.com/api/problem/1/check/2"
|> HTTPotion.get
|> Map.get(:body)
|> Poison.decode!
|> Map.get("result")
|> IO.inspect
