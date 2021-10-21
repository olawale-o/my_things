require 'json'
require_relative 'entities/label'
require_relative 'entities/genre'
require_relative 'entities/author'
require_relative 'entities/source'
require_relative 'entities/book'
require_relative 'entities/game'
require_relative 'entities/movie'
require_relative 'entities/music_album'

class Storage
  def stringify(args)
    labels = args[:labels]
    genres = args[:genres]
    sources = args[:sources]
    authors = args[:authors]
    items = args[:items]
    File.open('items.json', 'w') { |f| f.write JSON.generate(items) } unless items.empty?
    File.open('labels.json', 'w') { |f| f.write JSON.generate(labels) } unless labels.empty?
    File.open('genres.json', 'w') { |f| f.write JSON.generate(genres) } unless genres.empty?
    File.open('sources.json', 'w') { |f| f.write JSON.generate(sources) } unless sources.empty?
    File.open('authors.json', 'w') { |f| f.write JSON.generate(authors) } unless authors.empty?
  end

  def parse
    {
      items: parse_items,
      labels: parse_labels,
      sources: parse_sources,
      genres: parse_genres,
      authors: parse_authors
    }
  end

  def parse_labels
    file_name = 'labels.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |json|
      label = Label.new(json['title'], json['color'])
      label.id = json['id']
      label
    end
  end

  def parse_genres
    file_name = 'genres.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |json|
      genre = Genre.new(json['name'])
      genre.id = json['id']
      genre
    end
  end

  def parse_authors
    file_name = 'authors.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |json|
      author = Author.new(json['first_name'], json['last_name'])
      author.id = json['id']
      author
    end
  end

  def parse_sources
    file_name = 'sources.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |json|
      source = Source.new(json['name'])
      source.id = json['id']
      source
    end
  end

  def parse_items
    file_name = 'items.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |json|
      case json['json_class']
      when 'Book' then create_book json
      when 'Game' then create_game json
      when 'MusicAlbum' then create_album json
      when 'Movie' then create_movie json
      end
    end
  end

  def create_book(json)
    book = Book.new(json['publisher'], json['covered'], details(json))
    create_association(book, json)
    book
  end

  def create_game(json)
    game = Game.new(json['multiplayer'], json['last_played_at'], details(json))
    create_association(game, json)
    game
  end

  def create_album(json)
    album = MusicAlbum.new(json['on_spotify'], details(json))
    create_association(album, json)
    album
  end

  def create_movie(json)
    movie = Movie.new(json['silet'], details(json))
    create_association(movie, json)
    movie
  end

  def parse_association(json)
    author = parse_authors.detect { |a| a.id.eql?(json['author']['id']) }
    label = parse_labels.detect { |a| a.id.eql?(json['label']['id']) }
    genre = parse_genres.detect { |a| a.id.eql?(json['genre']['id']) }
    source = parse_sources.detect { |a| a.id.eql?(json['source']['id']) }
    [author, label, genre, source]
  end

  def create_association(item, json)
    author, label, genre, source = parse_association json
    item.add_label label
    item.add_author author
    item.add_genre genre
    item.add_source source
  end

  def details(json)
    { publish_date: json['publish_date'], archived: json['archived'] }
  end
end
