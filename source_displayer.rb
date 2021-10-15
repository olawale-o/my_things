require_relative 'displayer'

class SourceDisplayer < Displayer
  def initialize(items)
    super()
    @items = items
  end

  def display
    super
    list_all_sources
  end

  def list_all_sources
    puts 'Sources:'
    print "\n"
    @items.each_index do |idx|
      print "(#{idx}) #{@items[idx].source.name}"
      print "\n"
    end
  end

  private :list_all_sources
end
