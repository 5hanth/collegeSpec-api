defmodule CollegeSpec.CollegeController do
  use CollegeSpec.Web, :controller

  alias CollegeSpec.College

  def index(conn, _params) do
    colleges = Repo.all(College)
    render(conn, "index.json", colleges: colleges)
  end

  def create(conn, %{"college" => college_params}) do
    changeset = College.changeset(%College{}, college_params)

    case Repo.insert(changeset) do
      {:ok, college} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", college_path(conn, :show, college))
        |> render("show.json", college: college)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CollegeSpec.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    college = Repo.get!(College, id)
    render(conn, "show.json", college: college)
  end

  def update(conn, %{"id" => id, "college" => college_params}) do
    college = Repo.get!(College, id)
    changeset = College.changeset(college, college_params)

    case Repo.update(changeset) do
      {:ok, college} ->
        render(conn, "show.json", college: college)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CollegeSpec.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    college = Repo.get!(College, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(college)

    send_resp(conn, :no_content, "")
  end
end
