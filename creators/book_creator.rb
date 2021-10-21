require_relative 'creator'
require_relative '../entities/book'
require_relative '../modules/screen'

class BookCreator < Creator
  include Screen
  attr_accessor :books

  def initialize(books, args)
    super(args)
    @books = books
  end

  def create
    create_book
  end

  def create_book
    publisher, cover_state = create_book_screen
    publish_date, archived = create_item_screen
    details = {
      publish_date: publish_date,
      archived: !archived
    }
    book = Book.new(publisher, cover_state, details)
    @books << book
    create_associations book
    puts "Book created successfully \n\n"
  end

  private :create_book
end
