defmodule Unsplash.Gallery.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :label, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:label, :url])
    |> validate_required([:label, :url])
  end
end
