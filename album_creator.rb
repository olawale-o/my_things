require_relative 'creator'
require_relative 'entities/music_album'
require_relative 'modules/screen'

class MusicAlbumCreator < Creator
  include Screen
  attr_accessor :albums

  def initialize(albums)
    super()
    @albums = albums
  end

  def create
    create_album
  end

  def create_album
    genre, source, publish_date, archived, on_spotify = create_album_screen
    title, color = create_label_screen
    first_name, last_name = create_author_screen

    details = {
      genre: Genre.new(genre),
      label: Label.new(title, color),
      author: Author.new(first_name, last_name),
      source: Source.new(source),
      publish_date: publish_date,
      archived: !archived
    }
    book = MusicAlbum.new(!on_spotify, details)
    @albums << book
    puts "Music album created successfully \n\n"
  end

  private :create_album
end
