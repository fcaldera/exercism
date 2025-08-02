defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    result = case head do
      c when c in ?a..?z -> [c] 
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> ''
    end 
  
    result ++ sanitize(tail)
  end
end
