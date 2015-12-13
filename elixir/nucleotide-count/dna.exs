defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if Enum.any?(@nucleotides, &(&1 == nucleotide)) === false do
      raise ArgumentError
    end

    if Enum.all?(strand, fn(x) -> Enum.any?(@nucleotides, &(&1 === x)) end) === false do
      raise ArgumentError
    end

    strand
    |> Enum.count(&(&1 == nucleotide))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    @nucleotides
    |> Enum.map(&({
        &1, # nucleotide
        count(strand, &1) # count of nucleotides
       }))
    |> Enum.into %{}
  end
end
