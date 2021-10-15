require_relative 'displayer'

class GameDisplayer < Displayer
  def initialize(games)
    super()
    @games = games
  end

  def display
    super
    list_all_games
  end

  def list_all_games
    @games.map do |game|
      print "[#{game.class}] "
      print "#{game.label.title}, "
      print "By #{game.author.first_name} "
      print "Classified as #{game.genre.name}, "
      print "Sourced From #{game.source.name} "
      print "Published on: #{game.publish_date} "
      print "Archived: #{game.archived}, "
      print "It is a multiplayer: #{game.multiplayer} and was "
      print "Last Played on: #{game.last_played_at}"
      print "\n"
    end
  end

  private :list_all_games
end
