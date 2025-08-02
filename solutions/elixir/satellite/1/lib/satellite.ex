defmodule Satellite do
  @typedoc """
  A tree, which can be empty, or made from a left branch, a node and a right branch
  """
  @type tree :: {} | {tree, any, tree}

  @doc """
  Build a tree from the elements given in a pre-order and in-order style
  """
  @spec build_tree(preorder :: [any], inorder :: [any]) :: {:ok, tree} | {:error, String.t()}
  def build_tree(preorder, inorder) do
    case validate(preorder, inorder) do
      {:ok} -> {:ok, do_build_tree(preorder, inorder)}
      error -> error
    end
  end

  defp do_build_tree([], []), do: {}

  defp do_build_tree([root | preorder], inorder) do
    {in_left, in_right} = split_by(inorder, root)

    pre_left = Enum.filter(preorder, &Enum.member?(in_left, &1))
    pre_right = Enum.filter(preorder, &Enum.member?(in_right, &1))

    {do_build_tree(pre_left, in_left), root, do_build_tree(pre_right, in_right)}
  end

  defp validate(a, b) do
    cond do
      length(a) !== length(b) ->
        {:error, "traversals must have the same length"}

      MapSet.difference(MapSet.new(a), MapSet.new(b)) !== MapSet.new([]) ->
        {:error, "traversals must have the same elements"}

      Enum.uniq(a) !== a || Enum.uniq(b) !== b ->
        {:error, "traversals must contain unique items"}

      true ->
        {:ok}
    end
  end

  defp split_by(list, element) do
    list
    |> Enum.split_while(&(&1 !== element))
    |> then(fn {l, r} -> {l, tail(r)} end)
  end

  defp tail([]), do: []
  defp tail([_h | t]), do: t
end
