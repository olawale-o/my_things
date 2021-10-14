require_relative 'creator'
require_relative 'entities/book'
require_relative 'modules/screen'

class BookCreator < Creator
  include Screen
  attr_accessor :books

  def initialize(books)
    super()
    @books = books
  end

  def create
    create_book
  end

  def create_book
    genre, source, publish_date, archived, publisher, cover_state = create_book_screen
    title, color = create_label_screen
    first_name, last_name = create_author_screen

    details = {
      genre: Genre.new(genre),
      label: Label.new(title, color),
      author: Author.new(first_name, last_name),
      source: Source.new(source),
      publish_date: publish_date,
      archived: !archived
    }
    book = Book.new(publisher, cover_state, details)
    @books << book
    puts "Book created successfully \n\n"
  end

  private :create_book
end
