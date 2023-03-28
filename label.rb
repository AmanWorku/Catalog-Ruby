require_relative 'item'

class Label < Item
    
    def initialize(title, color)
        super(id = Random.rand(1..1000))
        @id = id
        @title = title
        @color = color
        @items = []
    end
end