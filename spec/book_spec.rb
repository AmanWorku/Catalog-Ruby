require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('The Review and Herald', 'Best') }

  describe '#new' do
    it 'Should create a new book object' do
      expect(book).to be_an_instance_of Book
    end
  end
  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(book).to be_kind_of Item
    end
  end
  describe '#publisher' do
    it 'Should return the publisher to be The Review and Herald' do
      expect(book.publisher).to eq 'The Review and Herald'
    end
  end
  describe '#cover_state' do
    it 'Should return the cover state to be best' do
      expect(book.cover_state).to eq 'Best'
    end
  end
end
