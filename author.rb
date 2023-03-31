class Author < Item
  attr_reader :id, :first_name, :last_name, :items

  @@id_counter = 0

  def initialize(first_name, last_name)
    @@id_counter += 1
    @id = @@id_counter
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    (item.is_a?(Item) && @items.include?(item)) || (@items << item)
    item.add_author(self)
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

 
end
