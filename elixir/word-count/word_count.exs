defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence = String.downcase(sentence)

    words = Enum.concat(Regex.scan(~r/[a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸçÇŒœßØøÅåÆæÞþÐð-]+/, sentence))

    hashDict = Enum.reduce(words, Map.new, fn(word, dict) ->
      Map.update(dict, word, 1, fn(value) ->
        value + 1
      end)
    end)

    hashDict
  end
end
