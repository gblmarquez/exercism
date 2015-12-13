defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_count = String.length(base)
    base_chars = String.codepoints(String.downcase(base))

    candidates
      |> Enum.filter(fn(x) -> String.length(x) == base_count end)
      |> Enum.filter(fn(x) -> anagram(x, base_chars) end)
      |> Enum.uniq
  end

  defp anagram(word, source_chars) do
    word_chars = String.codepoints(String.downcase(word))
    source_chars !== word_chars
      && Enum.sort(word_chars) === Enum.sort(source_chars)
  end
end
