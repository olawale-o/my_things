require_relative 'displayer'
require_relative 'entities/movie'

class MovieDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_movies
  end

  def list_all_movies
    puts "Movies: \n\n"
    @items.select { |item| item.instance_of? Movie }.map do |movie|
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
