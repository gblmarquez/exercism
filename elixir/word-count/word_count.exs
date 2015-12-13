defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @doc """
  Regular expression to find words in multiple languages.
  """
  @regex ~r/[\p{L}\p{N}-]+/u

  @spec count(String.t) :: map()
  def count(sentence) do
    find_words(String.downcase(sentence))
    |> aggregate_words
  end

  def find_words(sentence) do
    Regex.scan(@regex, sentence)
    |> Enum.concat
  end

  def aggregate_words(words) do
    Enum.reduce(words, %{ }, fn(word, dict) ->
      Map.update(dict, word, 1, &(&1 + 1))
    end)
  end
end
