defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    cond do
      strand1 === strand2 ->
        0
      Enum.count(strand1) !== Enum.count(strand2) ->
        nil
      true ->
        strand1
        |> Enum.with_index
        |> Enum.map(fn(x) ->
          index = elem(x, 1)
          if Enum.at(strand1, index) == Enum.at(strand2, index),
            do: 0,
          else: 1
        end)
        |> Enum.sum
    end
  end
end
