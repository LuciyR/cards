defmodule Mix.Tasks.Cards.Import do
  use Mix.Task

  # Parse the words from the given file
  def run(_) do
    File.ls!("words") |> Enum.each(&parse/1)
  end

  defp blank?(string), do: String.strip(string) == ""

  defp build(list) do
    [original_text, translated_text] = list

    %Cards.Card{original_text: original_text,
                translated_text: translated_text,
                review_date: Ecto.DateTime.utc}
    |> Cards.Repo.insert
  end

  defp parse(filename) do
    Path.join("words", filename)
    |> File.read!
    |> String.split("\n")
    |> Enum.chunk_by(&blank?/1)
    |> Enum.filter(fn(list) -> Enum.count(list) != 1 end)
    |> Enum.each(&build/1)
  end
end
