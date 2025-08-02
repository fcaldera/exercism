defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    [head | tail] = String.split(path, ".")
    do_extract_from_path(data[head], tail)
  end

  defp do_extract_from_path(data, []), do: data

  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
