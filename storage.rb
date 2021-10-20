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
  def stringify(items)
    books = items[:books]
    albums = items[:albums]
    movies = items[:movies]
    games = items[:games]
    File.open('books.json', 'w') { |f| f.write JSON.generate(books) }
    File.open('albums.json', 'w') { |f| f.write JSON.generate(albums) }
    File.open('movies.json', 'w') { |f| f.write JSON.generate(movies) }
    File.open('games.json', 'w') { |f| f.write JSON.generate(games) }
  end

  def parse
    {
      books: parse_books,
      albums: parse_albums,
      movies: parse_movies,
      games: parse_games
    }
  end

  def parse_details(item)
    label = Label.new(item['label']['title'], item['label']['color'])
    label.id = item['label']['id']
    genre = Genre.new(item['genre']['name'])
    genre.id = item['genre']['id']
    source = Source.new(item['source']['name'])
    source.id = item['source']['id']
    author = Author.new(item['author']['first_name'], item['author']['last_name'])
    author.id = item['author']['id']
    [label, genre, source, author]
  end

  def parse_books
    file_name = 'books.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |book|
      label, genre, source, author = parse_details book
      details = {
        label: label,
        genre: genre,
        source: source,
        author: author,
        publish_date: book['publish_date'],
        archived: book['archived']
      }
      Book.new(book['publisher'], book['covered'], details)
    end
  end

  def parse_albums
    file_name = 'albums.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |album|
      label, genre, source, author = parse_details album
      details = {
        label: label,
        genre: genre,
        source: source,
        author: author,
        publish_date: album['publish_date'],
        archived: album['archived']
      }
      MusicAlbum.new(album['on_spotify'], details)
    end
  end

  def parse_movies
    file_name = 'movies.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |movie|
      label, genre, source, author = parse_details movie
      details = {
        label: label,
        genre: genre,
        source: source,
        author: author,
        publish_date: movie['publish_date'],
        archived: movie['archived']
      }
      Movie.new(movie['silet'], details)
    end
  end

  def parse_games
    file_name = 'games.json'
    return [] unless File.exist? file_name

    JSON.parse(File.read(file_name)).map do |game|
      label, genre, source, author = parse_details game
      details = {
        label: label,
        genre: genre,
        source: source,
        author: author,
        publish_date: game['publish_date'],
        archived: game['archived']
      }
      Game.new(game['multiplayer'], game['last_played_at'], details)
    end
  end
end
