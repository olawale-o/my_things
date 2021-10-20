require 'date'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :label, :genre, :author, :source

  def initialize(args)
    @id = Random.rand(1..10_000)
    @publish_date = args[:publish_date]
    @archived = args[:archived]
  end

  def add_label(label)
    @label = label
    label.add_item self unless label.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item self unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.add_item self unless source.items.include?(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item self unless genre.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end
