require_relative 'item'
require_relative 'genre'

class MusicAlbum < Item
  attr_accessor :name, :genre, :publish_date, :on_spotify
  attr_reader :genres

  def initialize(name, publish_date, on_spotify: false)
    super(Date.parse(publish_date))
    @name = name
    @publish_date = Date.parse(publish_date)
    @on_spotify = on_spotify
    @genres = []
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10 && @on_spotify
  end

  def add_genre(genre)
    @genres << genre
  end
end
