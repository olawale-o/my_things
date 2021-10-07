require_relative 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(silet, args)
    super(args)
    @silet = silet
  end

  def can_be_archived?; end
end
