defmodule CollegeSpec.CollegeTest do
  use CollegeSpec.ModelCase

  alias CollegeSpec.College

  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = College.changeset(%College{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = College.changeset(%College{}, @invalid_attrs)
    refute changeset.valid?
  end
end
