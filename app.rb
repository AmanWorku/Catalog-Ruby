require_relative 'book'
require_relative 'label'
require_relative 'book_methods'
require_relative 'music_album'
require_relative 'music_album_store'
require_relative 'game_author'
require_relative 'game'
require 'json'

class App
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end

  def list_labels
    puts 'Listing all labels:'
    labels.each do |label|
      puts "Label #{label.id}: #{label.title} (#{label.color})"
    end
  end

  def add_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    labels << label
    label
  end

  def save_books(filename)
    File.write(filename, JSON.generate(books.map(&:to_h)))
  end

  def save_labels(filename)
    File.write(filename, JSON.generate(labels.map(&:to_h)))
  end

  def book_options
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
        save_books('data/books.json')
        puts 'Book added successfully'
      when '2'
        list_books(books)
      when '3'
        add_label
        save_labels('data/labels.json')
        puts 'Label added successfully'
      when '4'
        list_labels
      when '5'
        puts 'Thanks for using.'
        return
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end

def main_menu
  app = App.new
  puts "Welcome to our catalog 👋\nSelect an option:"
  options = [
    '1 - List books options',
    '====================================',
    '2 - List music options',
    '====================================',
    '3 - List game options',
    '====================================',
    '4 - Quit'
  ]
  puts options
  option = gets.chomp.downcase
  case option
  when '1'
    app.book_options
  when '2'
    store = MusicAlbumStore.new('./data/albums.json')
    store.run
  when '3'
    game = GameStore.new
    game.display_menu
  when '4'
    puts 'Thanks for using.'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end

main_menu
