defmodule CollegeSpec.CollegeControllerTest do
  use CollegeSpec.ConnCase

  alias CollegeSpec.College
  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, college_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    college = Repo.insert! %College{}
    conn = get conn, college_path(conn, :show, college)
    assert json_response(conn, 200)["data"] == %{"id" => college.id,
      "name" => college.name,
      "address" => college.address}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, college_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, college_path(conn, :create), college: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(College, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, college_path(conn, :create), college: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    college = Repo.insert! %College{}
    conn = put conn, college_path(conn, :update, college), college: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(College, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    college = Repo.insert! %College{}
    conn = put conn, college_path(conn, :update, college), college: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    college = Repo.insert! %College{}
    conn = delete conn, college_path(conn, :delete, college)
    assert response(conn, 204)
    refute Repo.get(College, college.id)
  end
end
