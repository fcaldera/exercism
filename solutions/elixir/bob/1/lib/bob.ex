defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    str = String.trim(input)
    cond do 
      str == "" -> "Fine. Be that way!"
      upcase?(str) -> cond do
        question?(str) -> "Calm down, I know what I'm doing!"
        true -> "Whoa, chill out!"
      end 
      question?(str) -> "Sure."
      true -> "Whatever."
    end
  end

  defp text?(str), do: str =~ ~r([a-zA-ZА-Яа-яЁё]) 
  defp upcase?(str), do: text?(str) && str == String.upcase(str) 
  defp question?(str), do: String.ends_with?(str, "?")
end
