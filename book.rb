require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @id = Random.rand(1..1000)
    super(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
