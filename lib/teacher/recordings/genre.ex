defmodule Teacher.Recordings.Genre do

  @all_genres [
    "alternative rock",
    "blues",
    "classical",
    "country",
    "disco",
    "dubstep",
    "electronic",
    "electronic dance music",
    "electronica",
    "folk",
    "funk",
    "grunge",
    "heavy metal",
    "hip hop",
    "indie",
    "jazz",
    "opera",
    "pop",
    "progressive rock",
    "psychedelic rock",
    "punk rock",
    "rap",
    "reggae",
    "rock",
    "rock and roll",
    "soul",
    "techno"
  ]

  def genres do
    @all_genres
  end

  def search(search_term) do
    search_term = String.downcase(search_term)
    Enum.filter(@all_genres, fn(genre) ->
      String.jaro_distance(genre, search_term) > 0.70
    end)
  end

end
