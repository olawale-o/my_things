require_relative 'displayer'
require_relative '../entities/music_album'

class MusicAlbumDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_albums
  end

  def list_all_albums
    puts "MusicAlbums: \n\n"
    @items.select { |item| item.instance_of? MusicAlbum }.map do |album|
      print "[#{album.class}] "
      print "#{album.label.title}, "
      print "By #{album.author.first_name} "
      print "Classified as #{album.genre.name}, "
      print "Sourced From #{album.source.name} "
      print "Published on: #{album.publish_date} "
      print "Archived: #{album.archived} and "
      print "Available on spotify: #{album.on_spotify}"
      print "\n"
    end
  end

  private :list_all_albums
end
