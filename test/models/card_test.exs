defmodule Cards.CardTest do
  use Cards.ModelCase
  alias Cards.Card

  @valid_attrs %{original_text: "some text", translated_text: "more text",
                 review_date: %Ecto.Date{year: 2016, month: 10, day: 2}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Card.changeset(%Card{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Card.changeset(%Card{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with blank fields" do
    %{errors: errors} = Card.changeset(%Card{}, %{})
    assert {:original_text,   {"can't be blank", []}} in errors
    assert {:translated_text, {"can't be blank", []}} in errors
    assert {:review_date,     {"can't be blank", []}} in errors
  end
end
