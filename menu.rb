class Main
  def display_menu
    puts "Welcome to our catalog 👋\nSelect an option:"
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all movies',
      '====================================',
      '4 - List all genres',
      '5 - List all labels',
      '6 - List all authors',
      '====================================',
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a movie',
      '10 - Quit'
    ]
    puts options
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end
end
