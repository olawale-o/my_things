require 'date'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author, :source

  def initialize(args)
    @id = Random.rand(1..10_000)
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
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end

  def move_to_archive
    @archived = can_be_archived? && true
  end
end
