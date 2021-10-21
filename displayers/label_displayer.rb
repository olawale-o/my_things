require_relative 'displayer'

class LabelDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_labels
  end

  def list_all_labels
    puts 'Labels:'
    print "\n"
    @items.each_index do |idx|
      print "(#{idx}) Title: #{@items[idx].title}, Color: #{@items[idx].color}"
      print "\n"
    end
  end

  private :list_all_labels
end
