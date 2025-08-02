defmodule FoodChain do
  @lines {
    """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """,
    """
    I know an old lady who swallowed a spider.
    It wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    """,
    """
    I know an old lady who swallowed a bird.
    How absurd to swallow a bird!
    She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    """,
    """
    I know an old lady who swallowed a cat.
    Imagine that, to swallow a cat!
    She swallowed the cat to catch the bird.
    """,
    """
    I know an old lady who swallowed a dog.
    What a hog, to swallow a dog!
    She swallowed the dog to catch the cat.
    """,
    """
    I know an old lady who swallowed a goat.
    Just opened her throat and swallowed a goat!
    She swallowed the goat to catch the dog.
    """,
    """
    I know an old lady who swallowed a cow.
    I don't know how she swallowed a cow!
    She swallowed the cow to catch the goat.
    """,
    """
    I know an old lady who swallowed a horse.
    She's dead, of course!
    """
  }

  @doc """
  Generate consecutive verses of the song 'I Know an Old Lady Who Swallowed a Fly'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    start..stop |> Enum.map_join("\n", &verse/1)
  end

  defp stanza(number), do: elem(@lines, number - 1)

  defp verse(number) when number in [1, 8], do: stanza(number)

  defp verse(number) do
    stanza(number) <> previous(number)
  end

  defp previous(from) do
    (from - 1)..1//-1
    |> Enum.map(&stanza/1)
    |> Enum.map_join("\n", &last_line/1)
    |> then(&Kernel.<>(&1, "\n"))
  end

  defp last_line(stanza) do
    stanza
    |> String.split("\n", trim: true)
    |> List.last()
  end
end
