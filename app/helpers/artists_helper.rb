module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, nested_route)
    if nested_route
      text_field_tag("song[artist_name]", !song.artist.nil? ? song.artist.name : "", id: "song_artist_name")
    else
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name), id: "song_artist_id"
    end
  end
end
