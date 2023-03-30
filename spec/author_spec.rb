require_relative '../author'

RSpec.describe Author do 
    let(:author) {Author.new('Henry', 'Ford')}

  describe '#new' do
    it 'Should create a new Author object' do
      expect(author).to be_an_instance_of Author
    end
  end
end