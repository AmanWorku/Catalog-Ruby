require_relative 'game'
require_relative 'author'

class GameStore
  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_game(game)
    @games << game
    game.authors.each { |author| add_author(author) }
  end

  def add_author(author)
    (author.is_a?(Author) && @authors.include?(author)) ||
      (@authors << author && author.items.each { |item| add_game(item) })
  end

  def list_games
    puts "List of games:"
    @games.each do |game|
      puts "#{game.title} by #{game.authors.map(&:full_name).join(', ')} (ID: #{game.id})"
    end
  end

  def list_authors
    puts "List of authors:"
    @authors.each do |author|
      puts "#{author.full_name} (ID: #{author.id})"
    end
  end

  def display_menu
    puts "Welcome! 👋😃\nChoose an option: 👉"
    puts '1. List all games'
    puts '2. List all authors'
    puts '3. Add game'
    puts '4. Quit'
  end
end
