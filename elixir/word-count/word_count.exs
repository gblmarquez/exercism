defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  @doc """
  Regular expression to find words in multiple languages.
  """
  @regex ~r/[a-zA-Z0-9ÀÈÌÒÙàèìòùÁÉÍÓÚÝáéíóúýÂÊÎÔÛâêîôûÃÑÕãñõÄËÏÖÜŸäëïöüŸçÇŒœßØøÅåÆæÞþÐð-]+/

  @spec count(String.t) :: map()
  def count(sentence) do
    Regex.scan(@regex, String.downcase(sentence))
    |> Enum.concat
    |> Enum.reduce(Map.new, fn(word, dict) ->
        Map.update(dict, word, 1, fn(value) ->
          value + 1
        end)
       end)
  end
end
