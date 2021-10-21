require_relative 'creator'
require_relative '../entities/music_album'
require_relative '../modules/screen'

class MusicAlbumCreator < Creator
  include Screen
  attr_accessor :albums

  def initialize(albums, args)
    super(args)
    @albums = albums
  end

  def create
    create_album
  end

  def create_album
    on_spotify = create_album_screen
    publish_date, archived = create_item_screen

    details = {
      publish_date: publish_date,
      archived: !archived
    }
    album = MusicAlbum.new(!on_spotify, details)
    @albums << album
    create_associations album
    puts "Music album created successfully \n\n"
  end

  private :create_album
end
