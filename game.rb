require_relative 'item'
require 'date'

class Game < Item

    def intialize(multiplayer, last_played_at, publish_date)
        super(id = Random.rand(1..1000))
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        @publish_date = publish_date.to
        @archived = can_be_archived?
end