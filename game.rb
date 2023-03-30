require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date
  attr_reader :id

  def initialize(multiplayer, last_played_at, publish_date)
    @id = Random.rand(1..1000)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @publish_date = Date.parse(publish_date).strftime('%Y/%m/%d')
    @archived = can_be_archived?
  end

  def can_be_archived?
    @archived = super || (Date.today - Date.parse(@last_played_at) > 365 * 2)
  end

  private :can_be_archived?
end
