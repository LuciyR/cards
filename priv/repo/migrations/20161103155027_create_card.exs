defmodule Cards.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :original_text,   :string
      add :translated_text, :string
      add :review_date,     :datetime
      timestamps
    end
  end
end
