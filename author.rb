require 'date'
require_relative 'item'

class Author < Item 
    attr_accessor :first_name, :last_name
    attr_reader :id, :items

    def initialize(first_name, last_name)
        super(id = Random.rand(1..1000))
        @first_name = first_name
        @last_name = last_name
        @items = []
    end

end