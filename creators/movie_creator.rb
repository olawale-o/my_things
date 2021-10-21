require_relative 'creator'
require_relative '../entities/movie'
require_relative '../modules/screen'

class MovieCreator < Creator
  include Screen
  attr_accessor :movies

  def initialize(movies, args)
    super(args)
    @movies = movies
  end

  def create
    create_movie
  end

  def create_movie
    silet = create_movie_screen
    publish_date, archived = create_item_screen

    details = {
      publish_date: publish_date,
      archived: !archived
    }
    movie = Movie.new(!silet, details)
    @movies << movie
    create_associations movie
    puts "Movie created successfully \n\n"
  end

  private :create_movie
end
