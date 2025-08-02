defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {an, ad} = a
    {bn, bd} = b
    reduce({an * bd + ad * bn, ad * bd})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {an, ad} = a
    {bn, bd} = b
    reduce({an * bd - ad * bn, ad * bd})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {an, ad} = a
    {bn, bd} = b
    reduce({an * bn, ad * bd})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {an, ad} = num
    {bn, bd} = den
    reduce({an * bd, ad * bn})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {num, den} = a
    reduce({Kernel.abs(num), Kernel.abs(den)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) when n < 0 do
    {num, den} = a
    pow_rational({den, num}, Kernel.abs(n))
  end

  def pow_rational(a, n) do
    {num, den} = a
    reduce({Integer.pow(num, n), Integer.pow(den, n)})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {a, b} = n
    :math.pow(:math.pow(x, a), 1 / b)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    {n, d} = a
    gcd = Integer.gcd(n, d)
    n = div(n, gcd)
    d = div(d, gcd)
    {if(d < 0, do: n * -1, else: n), Kernel.abs(d)}
  end
end
