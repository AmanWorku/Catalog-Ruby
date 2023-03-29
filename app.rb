require_relative 'book'
require_relative 'book_methods'

books = []

loop do
  puts "Enter '1' to add a book, '2' to list all books, or 'q' to quit:"
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
