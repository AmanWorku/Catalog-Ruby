require 'date'

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

    def can_be_archived?
        (Date.today.year - Date.parse(@publish_date).year) > 10
    end

    def move_to_archive
        @archived = true if can_be_archived?
    end

    private :can_be_archived?
end