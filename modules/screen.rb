module Screen
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
