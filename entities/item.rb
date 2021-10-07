class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author, :source

  def initialize(args)
    @id = 1
    @genre = args[:genre]
    @author = args[:author]
    @source = args[:source]
    @label = args[:label]
    @publish_date = args[:publish_date]
    @archived = args[:archived]
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?; end

  def move_to_archive; end
end