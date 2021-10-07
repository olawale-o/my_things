class Item
  def initialize(args)
    @id = 1
    @genre = args[:genre]
    @author = args[:author]
    @source = args[:source]
    @label = args[:label]
    @publish_date = args[:publish_date]
    @archived = args[:archived]
  end

  def can_be_archived?; end

  def move_to_archive; end
end
