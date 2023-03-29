require_relative 'book'
require_relative 'label'
require_relative 'book_methods'

books = []
labels = []

def list_labels(labels)
  puts 'Listing all labels:'
  labels.each do |label|
    puts "Label #{label.id}: #{label.title} (#{label.color})"
  end
end

def add_label(labels)
  puts 'Enter label title:'
  title = gets.chomp
  puts 'Enter label color:'
  color = gets.chomp
  label = Label.new(title, color)
  labels << label
  label
end
loop do
  puts 'Enter an option:'
  puts '1. Add a book'
  puts '2. List all books'
  puts '3. Add a label'
  puts '4. List all labels'
  puts '5. Exit'
  choice = gets.chomp.downcase

  case choice
  when '1'
    add_book(books)
    puts 'Book Added successfully'
  when '2'
    list_books(books)
  when '3'
    add_label(labels)
    puts 'Label Added successfully'
  when '4'
    list_labels(labels)
  when '5'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
