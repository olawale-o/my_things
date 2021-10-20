require_relative 'helper'

module Screen
  include Helper
  def user_input
    gets.chomp
  end

  def console(text)
    puts text
  end

  def create_item_screen_option
    puts "\n\n"
    print 'Do you want to add a book (1) or a music album (2) or a movie (3) or a game (4)? [Input the number]: '
    user_input.to_i
  end

  def create_author_screen
    puts "\n\n"
    puts 'Enter author information'
    print 'First name: '
    first_name = user_input
    print 'Last name: '
    last_name = user_input
    [first_name, last_name]
  end

  def create_label_screen
    puts "\n\n"
    puts 'Enter label information'
    print 'Title (Gift, New): '
    title = user_input
    print 'Color (Black): '
    color = user_input
    [title, color]
  end

  def create_genre_screen
    print 'Genre (e.g Comedy, Thriller): '
    user_input
  end

  def create_source_screen
    print 'Source (e.g Online shop, Friend): '
    user_input
  end

  def create_item_screen
    print 'Publish date (YYYY/MM/DD): '
    publish_date = user_input
    print 'Archived? [Y/N]: '
    archived = user_input == 'n'
    [parse_date(publish_date), archived]
  end

  def create_book_screen
    print 'Publisher (e.g Oreilly): '
    publisher = user_input
    print 'Cover state (e.g Good or bad): '
    cover_state = user_input
    [publisher, cover_state]
  end

  def create_album_screen
    print 'On spotify? [Y/N]: '
    user_input == 'n'
  end

  def create_movie_screen
    print 'Silet? [Y/N]: '
    user_input == 'n'
  end

  def create_game_screen
    print 'Multiplayer? [Y/N]: '
    multi_player = user_input == 'n'
    print 'Last Played At (YYYY/MM/DD): '
    last_played_at = user_input
    [multi_player, parse_date(last_played_at)]
  end

  def list_item_screen
    puts "\n\n"
    puts 'Choose between 1 and 4'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List all games'
    user_input.to_i
  end

  def show_welcome_screen
    puts "Welcome to Catalog of my things\n\n"
    puts '1 - List all items'
    puts '2 - List all genres (e.g Comedy, Thriller)'
    puts '3 - List all labels (e.g. Gift, New)'
    puts '4 - List all authors (e.g. Stephen King)'
    puts '5 - List all sources (e.g. From a friend, Online shop)'
    puts '6 - Add an item'
    puts '7 - Exit'
  end
end
