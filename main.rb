require_relative 'modules/screen'
require_relative 'book_creator'
require_relative 'book_displayer'
require_relative 'album_creator'
require_relative 'album_displayer'
require_relative 'movie_creator'
require_relative 'movie_displayer'
require_relative 'game_creator'
require_relative 'game_displayer'
require_relative 'genre_displayer'
require_relative 'label_displayer'
require_relative 'source_displayer'
require_relative 'author_displayer'
require_relative 'entities/music_album'
require_relative 'entities/book'
require_relative 'entities/movie'
require_relative 'entities/game'
require_relative 'storage'

class App
  include Screen

  def initialize
    @storage = Storage.new
    @items = @storage.parse[:items]
    @labels = @storage.parse[:labels]
    @sources = @storage.parse[:sources]
    @authors = @storage.parse[:authors]
    @genres = @storage.parse[:genres]
    @associations = { labels: @labels, sources: @sources, genres: @genres, authors: @authors }
    @book_creator = BookCreator.new(@items, @associations)
    @book_displayer = BookDisplayer.new(@items)
    @album_creator = MusicAlbumCreator.new(@items, @associations)
    @album_displayer = MusicAlbumDisplayer.new(@items)
    @movie_creator = MovieCreator.new(@items, @associations)
    @movie_displayer = MovieDisplayer.new(@items)
    @game_creator = GameCreator.new(@items, @associations)
    @game_displayer = GameDisplayer.new(@items)
    @genre_displayer = GenreDisplayer.new(@associations[:genres])
    @label_displayer = LabelDisplayer.new(@associations[:labels])
    @source_displayer = SourceDisplayer.new(@associations[:sources])
    @author_displayer = AuthorDisplayer.new(@associations[:authors])
  end

  def execute
    is_running = true
    while is_running
      show_welcome_screen
      key = user_input.to_i
      if key.eql?(7)
        hash = {
          labels: @labels,
          authors: @authors,
          sources: @sources,
          genres: @genres,
          items: @items
        }
        @storage.stringify(hash)
        is_running = false
      else
        handle_all_actions(key)
      end
    end
  end

  private

  def handle_create_item
    key = create_item_screen_option
    case key
    when 1
      @book_creator.create
    when 2
      @album_creator.create
    when 3
      @movie_creator.create
    when 4
      @game_creator.create
    end
  end

  def handle_list_items
    key = list_item_screen
    case key
    when 1
      @book_displayer.display
    when 2
      @album_displayer.display
    when 3
      @movie_displayer.display
    when 4
      @game_displayer.display
    end
  end

  def handle_all_actions(key)
    case key
    when 1
      handle_list_items
    when 2
      @genre_displayer.display
    when 3
      @label_displayer.display
    when 4
      @author_displayer.display
    when 5
      @source_displayer.display
    when 6
      handle_create_item
    else
      puts 'Please select a number between 1 and 7'
    end
  end
end

def main
  app = App.new
  app.execute
end

main
