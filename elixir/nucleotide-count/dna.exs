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
    if Enum.any?([?A, ?C, ?G, ?T], fn(x)-> x === nucleotide end) === false do
      raise ArgumentError
    end

    if Enum.all?(strand, fn(x)-> Enum.any?([?A, ?C, ?G, ?T], fn(y)-> y === x end) end) === false do
      raise ArgumentError
    end

    strand
      |> Enum.count(fn(x) -> x == nucleotide end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.nucleotide_counts('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec nucleotide_counts([char]) :: Dict.t
  def nucleotide_counts(strand) do
    %{?A => count(strand, ?A),
      ?C => count(strand, ?C),
      ?G => count(strand, ?G),
      ?T => count(strand, ?T)}
  end
end
