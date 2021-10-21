require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, args)
    super(args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

  def to_json(*args)
    suoer.merge(
      {
        JSON.create_id => self.class.name,
        'id' => @id,
        'multiplayer' => @multiplayer,
        'last_played_at' => @last_played_at
      }
    ).to_json(*args)
  end
end
