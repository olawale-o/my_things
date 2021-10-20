class Author
  attr_reader :items
  attr_accessor :first_name, :last_name, :id

  def initialize(first_name, last_name)
    @id = 1
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_author self
  end
end
