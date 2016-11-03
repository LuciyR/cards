defmodule Cards.Card do
  use Cards.Web, :model

  schema "cards" do
    field :original_text,   :string
    field :translated_text, :string
    field :review_date,     Ecto.Date
    timestamps
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:original_text, :translated_text, :review_date])
    |> validate_required([:original_text, :translated_text, :review_date])
  end
end
