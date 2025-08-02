defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list) do
    do_count(list, 0)
  end

  defp do_count({}, acum), do: acum

  defp do_count({_, tail}, acum) do
    do_count(tail, acum + 1)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    tuple_size(list) == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    do_get(list, &elem(&1, 0))
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    do_get(list, &elem(&1, 1))
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    result = peek(list)

    case result do
      {:ok, item} -> {:ok, item, list |> tail |> elem(1)}
      result -> result
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
    |> Enum.reverse()
    |> Enum.reduce(new(), &push(&2, &1))
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    do_to_list(list, [])
  end

  defp do_to_list({}, result), do: Enum.reverse(result)

  defp do_to_list({head, tail}, result) do
    do_to_list(tail, [head | result])
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    do_reverse(list, new())
  end

  defp do_reverse({}, result), do: result

  defp do_reverse({head, tail}, result) do
    do_reverse(tail, push(result, head))
  end

  defp do_get(list, fun) do
    case empty?(list) do
      true -> {:error, :empty_list}
      false -> {:ok, fun.(list)}
    end
  end
end
