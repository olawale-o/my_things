require_relative 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(silet, args)
    super(args)
    @silet = silet
  end

  def can_be_archived?
    super || @silet.eql?(true)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'label' => @label,
      'author' => @author,
      'genre' => @genre,
      'source' => @source,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'silet' => @silet
    }.to_json(*args)
  end
end
