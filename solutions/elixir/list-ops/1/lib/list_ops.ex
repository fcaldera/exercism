defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    foldl(l, 0, fn _, acc -> acc + 1 end)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    foldl(l, [], fn item, acc -> [item | acc] end)
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    foldr(l, [], fn item, acc -> [f.(item) | acc] end)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    foldr(l, [], fn item, acc -> if f.(item), do: [item | acc], else: acc end)
  end

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl([], acc, _), do: acc

  def foldl([h | t], acc, f), do: foldl(t, f.(h, acc), f)

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f) do
    l |> reverse() |> foldl(acc, f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    foldr(a, b, fn item, acc -> [item | acc] end)
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    foldr(ll, [], &append/2)
  end
end
