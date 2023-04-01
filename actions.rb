class Actions
  def list_of_actions
    puts "Choose an option from the list of available actions:\n"
    options = [
      '1 - List all books',
      '2 - List all music albums',
      '3 - List all genres',
      '5 - List all labels',
      '6 - List all games',
      '7 - List all authors',
      '8 - Add a book',
      '9 - Add a music album',
      '10 - Add a game',
      '11 - Quit'
    ]
    puts options
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end
end
