defmodule Teenager do
  def hey(input) do
    cond do
        String.length(String.lstrip(input)) == 0 ->
          "Fine. Be that way!"
        String.match?(input, ~r/([А-Я0-9]{2,}|[A-Z0-9]{2,})/) ->
          "Whoa, chill out!"
        String.match?(input, ~r/^[A-Z0-9\s].*\?$/) ->
          "Sure."
        String.match?(input, ~r/^[A-Z0-9\s].*/) ->
          "Whatever."
    end
  end
end
