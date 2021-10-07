class Genre
  attr_accessor :id, :name
  attr_reader :items

  def initialize(name)
    @id = 1
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
