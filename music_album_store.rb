require_relative 'music_album'

class MusicAlbumStore
  def initialize
    @albums = []
  end

  def display_menu
    puts "Choose an option:"
    puts "1. List all albums"
    puts "2. List all genres"
    puts "3. Add an album"
    puts "4. Quit"
  end

  def list_all_albums
    if @albums.empty?
      puts "No albums found."
    else
      @albums.each do |album|
        puts "#{album.name} (#{album.publish_date.year}) #{album.genres}"
      end
    end
  end

  def list_all_genres
    genres = @albums.map(&:genres).flatten.uniq
    if genres.empty?
      puts "No genres found."
    else
      genres.each do |genre|
        puts genre
      end
    end
  end

  def add_album
    puts 'Enter album title:'
    name = gets.chomp
    puts 'Enter date of release (YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Is it on spotify? (Y/N):'
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Enter the genre of the music album:'
    genres = gets.chomp.split(',').map(&:strip)
    album = MusicAlbum.new(name, publish_date, on_spotify: on_spotify, genres: genres)
    @albums << album
    puts "Added #{album.name}."
  end

  def run
    loop do
      display_menu
      option = gets.chomp.to_i
      case option
      when 1
        list_all_albums
      when 2
        list_all_genres
      when 3
        add_album
      when 4
        break
      else
        puts "Invalid option."
      end
    end
  end
end

album = MusicAlbum.new("Some Album", "2022-01-01", genres: ["Rock", "Pop"])
album.add_genre("Electronic")
puts album.genres
