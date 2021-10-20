require_relative 'creator'
require_relative 'entities/game'
require_relative 'modules/screen'

class GameCreator < Creator
  include Screen
  attr_accessor :games

  def initialize(games, args)
    super(args)
    @games = games
  end

  def create
    create_game
  end

  def create_game
    multi_player, last_played_at = create_game_screen
    publish_date, archived = create_item_screen

    details = {
      publish_date: publish_date,
      archived: !archived
    }
    game = Game.new(!multi_player, last_played_at, details)
    @games << game
    create_associations game
    puts "Game created successfully \n\n"
  end

  private :create_game
end
