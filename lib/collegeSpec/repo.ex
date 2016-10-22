defmodule CollegeSpec.Repo do
  use Ecto.Repo, otp_app: :collegeSpec
  use Scrivener, page_size: 10
end
