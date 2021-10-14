require_relative 'creator'
require_relative 'entities/movie'
require_relative 'modules/screen'

class MovieCreator < Creator
  include Screen
  attr_accessor :movies

  def initialize(movies)
    super()
    @movies = movies
  end

  def create
    create_movie
  end

  def create_movie
    genre, source, publish_date, archived, silet = create_movie_screen
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
    movie = Movie.new(!silet, details)
    @movies << movie
    puts "Movie created successfully \n\n"
  end

  private :create_movie
end
