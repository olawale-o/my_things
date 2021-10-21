require_relative 'displayer'

class AuthorDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_authors
  end

  def list_all_authors
    puts 'Authors:'
    print "\n"
    @items.each_index do |idx|
      print "(#{idx}) First name: #{@items[idx].first_name} Last name: #{@items[idx].last_name}"
      print "\n"
    end
  end

  private :list_all_authors
end
