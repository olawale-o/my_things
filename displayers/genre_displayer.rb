require_relative 'displayer'

class GenreDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_genres
  end

  def list_all_genres
    puts 'Genres:'
    print "\n"
    @items.each_index do |idx|
      print "(#{idx}) #{@items[idx].name}"
      print "\n"
    end
  end

  private :list_all_genres
end
