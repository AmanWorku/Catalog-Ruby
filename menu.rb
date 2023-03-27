class Main
  def display_menu
    puts "Welcome to our catalog 👋\nSelect an option:"
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all movies',
      '4 - List all games',
      '5 - Add a book',
      '6 - Add a music album',
      '7 - Add a movie',
      '8 - Add a game',
      '9 - Quit'
    ]
    puts options
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end
end
