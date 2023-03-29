require_relative 'book'

def add_book(books)
  puts 'Enter book publisher:'
  publisher = gets.chomp
  puts 'Enter cover state (good/bad):'
  cover_state = gets.chomp
  book = Book.new(publisher, cover_state)
  books << book
  book
end

def list_books(books)
  puts 'List of all books:'
  books.each do |book|
    puts "Book ID: #{book.id},
    Publisher: #{book.publisher},
    Cover State: #{book.cover_state},
    Archived: #{book.archived}"
  end
end
