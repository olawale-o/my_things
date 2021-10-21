require_relative '../modules/screen'
require_relative '../entities/author'
require_relative '../entities/label'
require_relative '../entities/source'
require_relative '../entities/genre'
require_relative '../association_creator'

class Creator
  include Screen

  def initialize(args)
    @association_creator = AssociationCreator.new(args)
  end

  def create; end

  private

  def create_associations(item)
    @association_creator.add_label item
    @association_creator.add_source item
    @association_creator.add_genre item
    @association_creator.add_author item
  end
end
