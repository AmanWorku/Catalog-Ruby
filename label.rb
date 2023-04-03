require_relative 'item'

class Label < Item
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    super()
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
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
