require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id = Random.rand(1..1000))
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = label
    @publish_date = nil
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end
end
