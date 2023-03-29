require_relative 'item'

class Book < Item
  attr_reader :id
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    @id = Random.rand(1..1000)
    super()
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

  def to_h
    {
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
      genre: @genre,
      author: @author,
      source: @source,
      label: @label&.to_h,
      publish_date: @publish_date,
      archived: @archived
    }
  end
end
