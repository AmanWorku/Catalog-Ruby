require_relative 'item'
require 'date'

class Game < Item

    attr_accessor :multiplayer, :last_played_at, :publish_date
    attr_reader :id
    def intialize(multiplayer, last_played_at, publish_date)
        super(id = Random.rand(1..1000))
        @multiplayer = multiplayer
        @last_played_at = last_played_at
        @publish_date = publish_date.to
        @archived = can_be_archived?
    end

    def can_be_archived?
        @archived = if super || Date.today - Date.parse(@last_played_at) > 365 * 2
            true
        else
            false
        end
end