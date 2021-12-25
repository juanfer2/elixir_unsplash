defmodule UnsplashWeb.GalleryResolver do
  alias Unsplash.Gallery
  alias IO

  def images(_root, _args, _info) do
    {:ok, Gallery.list_images}
  end

  def create_image(_root, args, _info) do
    Gallery.create_image(args)
  end

  def delete_image(_root, args, _info) do
    try do
      image = Gallery.get_image!(args.id)
      {:ok, _image} = Gallery.delete_image(image)
    rescue
      #ArgumentError ->
      value ->
        IO.puts("Invalid argument given")
        {:error, value}
    end
  end
end
