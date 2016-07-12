defmodule StringCalc do
  @default_delimiters [",", "\n"]

  def add(""), do: 0
  def add(numbers) do
    parse_nums(numbers)
    |> Enum.map(&String.to_integer/1)
    |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

  def parse_nums(numbers) do
    new_delim = parse_delimiter(numbers)
    remove_delimiter(new_delim, numbers)
    |> String.split(@default_delimiters ++ new_delim)
  end

  def parse_delimiter(numbers) do
    Regex.scan(~r{^//(.*)}, numbers, capture: :all_but_first)
    |> normalize_delimiter
  end

  def normalize_delimiter([]), do: []
  def normalize_delimiter([delimiter]), do: delimiter

  def remove_delimiter([], numbers), do: numbers

  def remove_delimiter(delim, numbers) do
    Regex.replace(~r{//#{delim}\n}, numbers, "")
  end
end
