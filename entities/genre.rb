class Genre
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name)
    @id = 1
    @name = name
    @items = []
  end
end
