require_relative 'entities/source'
require_relative 'entities/author'
require_relative 'entities/label'
require_relative 'entities/genre'
require_relative 'modules/screen'

class AssociationCreator
  include Screen
  def initialize(args)
    @labels = args[:labels]
    @authors = args[:authors]
    @genres = args[:genres]
    @sources = args[:sources]
  end

  def add_label(item)
    puts 'Choose an label from the list below or "n" to create one: '
    @labels.each_index do |i|
      puts "(#{i}) Title: #{@labels[i].title}. Color: #{@labels[i].color}"
    end
    label = nil
    key = user_input
    if key.eql?('n')
      title, color = create_label_screen
      label = Label.new(title, color)
      @labels << label
    else
      label = @labels[key.to_i]
    end
    item.add_label label
  end

  def add_genre(item)
    puts 'Choose a genre from the list below or "n" to create one: '
    @genres.each_index do |i|
      puts "(#{i}) genre name: #{@genres[i].name} "
    end
    genre = nil
    key = user_input
    if key.eql?('n')
      print 'genre name? (e.g Thriller): '
      name = create_genre_screen
      genre = Genre.new(name)
      @genres.push(genre)
    else
      genre = @genres[key.to_i]
    end
    item.add_genre genre
  end

  def add_author(item)
    puts 'Choose an author from the list below or "n" to create one: '
    @authors.each_index do |idx|
      puts "(#{idx}) First name: #{@authors[idx].first_name} Last name: #{@authors[idx].last_name}"
    end
    author = nil
    key = user_input
    if key.eql?('n')
      first_name, last_name = create_author_screen
      author = Author.new(first_name, last_name)
      @authors << author
    else
      author = @authors[key.to_i]
    end
    item.add_author author
  end

  def add_source(item)
    puts 'Choose a source from the list below or "n" to create one: '
    @sources.each_index do |idx|
      puts "(#{idx}) Name: #{@sources[idx].name}"
    end
    source = nil
    key = user_input
    if key.eql?('n')
      name = create_source_screen
      source = Source.new(name)
      @sources << source
    else
      source = @sources[key.to_i]
    end
    item.add_source source
  end
end
