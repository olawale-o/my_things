require_relative 'creator'
require_relative 'entities/game'
require_relative 'modules/screen'

class GameCreator < Creator
  include Screen
  attr_accessor :games

  def initialize(games)
    super()
    @games = games
  end

  def create
    create_game
  end

  def create_game
    genre, source, publish_date, archived, multi_player, last_played_at = create_game_screen
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
    game = Game.new(!multi_player, last_played_at, details)
    @games << game
    puts "Game created successfully \n\n"
  end

  private :create_game
end
