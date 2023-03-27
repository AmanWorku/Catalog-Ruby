require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(id = Random.rand(1..1000))
    @id = id
    @publisher = publisher
    @cover_state = cover_state
  end
end
