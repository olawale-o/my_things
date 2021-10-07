class Label
  attr_accessor :id, :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = 1
    @title = title
    @color = color
    @items = []
  end
end