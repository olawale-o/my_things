require_relative 'displayer'
require_relative '../entities/book'

class BookDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_books
  end

  def list_all_books
    puts "Books: \n\n"
    @items.select { |item| item.instance_of? Book }.map do |book|
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
