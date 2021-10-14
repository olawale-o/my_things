require_relative 'displayer'

class MovieDisplayer < Displayer
  def initialize(movies)
    super()
    @movies = movies
  end

  def display
    super
    list_all_movies
  end

  def list_all_movies
    @movies.map do |movie|
      print "[#{movie.class}] "
      print "#{movie.label.title}, "
      print "By #{movie.author.first_name} "
      print "Classified as #{movie.genre.name}, "
      print "Sourced From #{movie.source.name} "
      print "Published on: #{movie.publish_date} "
      print "Archived: #{movie.archived} and "
      print "It is a silet: #{movie.silet}"
      print "\n"
    end
  end

  private :list_all_movies
end
