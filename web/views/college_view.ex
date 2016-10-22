defmodule CollegeSpec.CollegeView do
  use CollegeSpec.Web, :view

  def render("index.json", %{colleges: colleges}) do
    %{data: render_many(colleges, CollegeSpec.CollegeView, "college.json")}
  end

  def render("show.json", %{college: college}) do
    %{data: render_one(college, CollegeSpec.CollegeView, "college.json")}
  end

  def render("college.json", %{college: college}) do
    %{id: college.id,
      name: college.name,
      address: college.address}
  end
end
