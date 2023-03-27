class Item
    attr_reader :id, :genre, :author, :source, :label, :publish_date, :archived
    
    def initialize (@id, @genre, @author, @source, @label, @publish_date, @archived)
       @id = id
       @genre = genre
       @author = author
       @source = source
       @label = label
       @publish_date = publish_date
       @archived = archived
    end
end