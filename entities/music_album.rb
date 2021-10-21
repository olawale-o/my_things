require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, args)
    super(args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify.eql?(true)
  end

  def to_json(*args)
    super.merge(
      {
        JSON.create_id => self.class.name,
        'id' => @id,
        'on_spotify' => @on_spotify
      }
    ).to_json(*args)
  end
end
