require_relative '../author'

RSpec.describe Author do 
    let(:author) {Author.new('Henry', 'Ford')}

  describe '#new' do
    it 'Should create a new Author object' do
      expect(author).to be_an_instance_of Author
    end
  end
  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(author).to be_kind_of Item
    end
  end
  describe '#first_name' do
    it 'Should return the first name to be Henry' do
      expect(author.first_name).to eq 'Henry'
    end
  end
  describe '#last_name' do
    it 'Should return the last name to be Ford' do
      expect(author.last_name).to eq 'Ford'
    end
  end
end