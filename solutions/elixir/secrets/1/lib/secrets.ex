defmodule Secrets do
  def secret_add(secret), do: &(&1 + secret)
  def secret_subtract(secret), do: &(&1 - secret)
  def secret_multiply(secret), do: &(&1 * secret)
  def secret_divide(secret), do: &(div(&1, secret))
  def secret_and(secret), do: &(Bitwise.&&&(&1, secret))
  def secret_xor(secret), do: &(Bitwise.^^^(&1, secret))
  def secret_combine(sf1, sf2), do: &(&1 |> sf1.() |> sf2.()) 
end
