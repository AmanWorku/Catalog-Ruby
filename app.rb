require_relative 'book'
require_relative 'book_methods'

books = []

loop do
    puts "Enter an option:"
    puts "1. Add a book"
    puts "2. List all books"
    puts "3. List all labels"
    puts "4. Exit"
  choice = gets.chomp.downcase

  case choice
  when '1'
    add_book(books)
  when '2'
    list_books(books)
  when 'q'
    break
  else
    puts "Invalid choice. Please try again."
  end
end
