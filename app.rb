require_relative 'book'
require_relative 'label'
require_relative 'book_methods'
require 'json'

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


def save_books(books, filename)
  File.open(filename, 'w') do |file|
    file.write(JSON.generate(books.map(&:to_h)))
  end
end

def save_labels(labels, filename)
  File.open(filename, 'w') do |file|
    file.write(JSON.generate(labels.map(&:to_h)))
  end
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
    save_books(books, 'data/books.json')
    puts 'Book Added successfully'
  when '2'
    list_books(books)
  when '3'
    add_label(labels)
    save_labels(labels, 'data/labels.json')
    puts 'Label Added successfully'
  when '4'
    list_labels(labels)
  when '5'
    puts 'Thanks for using.'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
