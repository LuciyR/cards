defmodule Cards.PageControllerTest do
  use Cards.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Cards!"
  end
end
