defmodule UnsplashWeb.Types.ImageType do
  use Absinthe.Schema.Notation

  object :image do
    field :id, non_null(:id)
    field :url, :string
    field :label, :string
  end
end
