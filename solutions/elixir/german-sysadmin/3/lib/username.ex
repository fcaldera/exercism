defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    case head do
      c when c in ?a..?z -> [c] 
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> ''
    end ++ sanitize(tail)
  end
end
