require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :authors
  attr_reader :id, :title

  def initialize(title, multiplayer, last_played_at, publish_date, authors=[])
    @id = Random.rand(1..1000)
    super()
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = Date.parse(publish_date).strftime('%Y/%m/%d')
    @archived = can_be_archived?
    @authors = []
    add_authors(authors)
  end

  def add_authors(authors)
    @authors ||= []
    authors.each { |author| add_author(author) }
  end  

  def add_author(author)
    if !authors.include?(author)
      authors << author
      author.add_item(self)
    end
  end

  def can_be_archived?
    @archived = super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end

  private :can_be_archived?


  
  
end
