defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence = String.downcase(sentence)

    dict = dict_impl.new
    words = String.split(sentence, " ")

    dict = Dict.put(dict, :hello, :world)
  end
end
