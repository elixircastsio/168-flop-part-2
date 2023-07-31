defmodule Teacher.Recordings.Album do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {
    Flop.Schema,
    filterable: [:title, :artist, :year],
    sortable: [:title, :artist, :year],
    default_limit: 4
  }

  @attrs [
    :title,
    :artist,
    :summary,
    :year,
    :genre
  ]

  schema "albums" do
    field :artist, :string
    field :summary, :string
    field :title, :string
    field :year, :integer
    field :genre, :string

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, @attrs)
    |> validate_required(@attrs)
  end
end
