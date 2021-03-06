defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_ | tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(l), do: foldLeft(l, [], fn (x, acc) -> [x | acc] end)

  def foldLeft([], acc, _f), do: acc
  def foldLeft([h | t], acc, f), do: foldLeft(t, f.(h, acc), f)

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], f), do: [ f.(head) | map(tail, f) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], f) do
    if f.(head) === true do
      [ head | filter(tail, f) ]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append([], b), do: b
  def append(a, []), do: a
  def append([head | tail], b) do
    [ head | append(tail, b) ]
  end

  @spec concat([[any]]) :: [any]
  def concat(l), do: _concat(l)
  defp _concat([]), do: []
  defp _concat([head | tail]) do
    append(head, _concat(tail))
  end
end
