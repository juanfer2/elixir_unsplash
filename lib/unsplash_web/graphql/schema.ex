defmodule UnsplashWeb.Schema do
  use Absinthe.Schema
  import_types UnsplashWeb.Types.ImageType

  alias UnsplashWeb.HealtResolver
  alias UnsplashWeb.GalleryResolver

  query do
    @desc "Healt query"
    field :healt, non_null(:string) do
      resolve(&HealtResolver.healt/3)
    end

    @desc "Get all Images"
    field :images, list_of(:image) do
      resolve(&GalleryResolver.images/3)
    end
  end

  mutation do
    @desc "Create image"
    field :create_image, type: :image do
      arg :label, non_null(:string)
      arg :url, non_null(:string)

      resolve(&GalleryResolver.create_image/3)
    end

    @desc "Delete image"
    field :delete_image, type: :image do
      arg :id, non_null(:id)

      resolve(&GalleryResolver.delete_image/3)
    end
  end
end
