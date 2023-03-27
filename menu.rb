class main
  def display_menu
     puts "Welcome to our catalog 👋\nSelect an option:"
     option = [
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
     puts option
  end

  def get_input(prompt, type = :to_s)
    print prompt
    choice = gets.chomp
    type == :to_i ? input.to_i : input
  end
end



