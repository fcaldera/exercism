defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, "all side lengths must be positive"}
  end 

  def kind(a, b, c) when a + b < c or a + c < b or b + c < a do
    {:error, "side lengths violate triangle inequality"}
  end 

  def kind(a, b, c) do
    case {a, b, c} do
      {a, a, a} -> {:ok, :equilateral}
      {a, a, c} -> {:ok, :isosceles}
      {a, b, a} -> {:ok, :isosceles}
      {a, b, b} -> {:ok, :isosceles}
      {a, b, c} -> {:ok, :scalene}
    end
  end
end
