defmodule StringCalc do
  @default_delimiters [",", "\n"]

  def add(""), do: 0
  def add(numbers) do
    parse_nums(numbers)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

  def parse_nums("//" <> <<delim::bytes-size(1)>> <> "\n" <> rest) do
    String.split(rest, @default_delimiters ++ [delim])
  end

  def parse_nums(numbers) do
    String.split(numbers, @default_delimiters)
  end
end
