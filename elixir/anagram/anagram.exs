defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_count = String.length(base)
    base_chars = String.codepoints(String.downcase(base))

    candidates
      |> Enum.filter(&(String.length(&1) == base_count))
      |> Enum.filter(&(anagram(&1, base_chars)))
      |> Enum.uniq
  end

  defp anagram(word, source_chars) do
    word_chars = String.codepoints(String.downcase(word))
    source_chars !== word_chars
      &&
    Enum.sort(word_chars) === Enum.sort(source_chars)
  end
end
