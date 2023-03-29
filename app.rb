require_relative 'book'
require_relative 'label'
require_relative 'book_methods'

books = []
label = []

def list_labels(labels)
    puts "Listing all labels:"
    labels.each do |label|
      puts "Label #{label.id}: #{label.title} (#{label.color})"
    end
  end

  def add_book(books)
    puts "Enter book publisher:"
    publisher = gets.chomp
    puts "Enter cover state (good/bad):"
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state)
    books << book
    book
  end
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
    puts "Book Added successfully"
  when '2'
    list_books(books)
  when '3'
    list_labels(labels)
  when 'q'
    break
  else
    puts "Invalid choice. Please try again."
  end
end
