defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    result = case head do
      char when char > 96 and char < 123 -> [char] # a..z
      char when char == 95 -> [char] # _
      char when char == 228 -> 'ae' # ä becomes ae
      char when char == 246 -> 'oe' # ö becomes oe
      char when char == 252 -> 'ue' # ü becomes ue
      char when char == 223 -> 'ss' # ß becomes ss
      _ -> ''
    end

    result ++ sanitize(tail)
  end
end
