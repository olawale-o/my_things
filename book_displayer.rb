require_relative 'displayer'

class BookDisplayer < Displayer
  def initialize(books)
    super()
    @books = books
  end

  def display
    super
    list_all_books
  end

  def list_all_books
    @books.map do |book|
      print "[#{book.class}] "
      print "#{book.label.title}, "
      print "By #{book.author.first_name} "
      print "Classified as #{book.genre.name}, "
      print "Sourced From #{book.source.name} "
      print "Published on: #{book.publish_date} "
      print "Archived: #{book.archived} "
      print "Publisher By: #{book.publisher} "
      print "\n"
    end
  end

  private :list_all_books
end
