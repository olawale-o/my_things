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

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def source=(source)
    @autsourcehor = source
    source.items.push(self) unless source.items.include?(self)
  end

  def can_be_archived?; end

  def move_to_archive; end
end
