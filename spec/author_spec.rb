require_relative '../author'

RSpec.describe Author do
  describe '#initialize' do
    context 'when given valid parameters' do
      let(:author) { Author.new('John', 'Doe', []) }

      it 'sets a unique ID' do
        author1 = Author.new('Jane', 'Doe', [])
        expect(author1.id).to eq(author.id + 1)
      end

      it 'sets the first name' do
        expect(author.first_name).to eq('John')
      end

      it 'sets the last name' do
        expect(author.last_name).to eq('Doe')
      end

      it 'sets an empty items array' do
        expect(author.items).to be_empty
      end
    end
  end

  describe '#add_item' do
    let(:book) { double('book') }
    let(:author) { Author.new('John', 'Doe', []) }

    context 'when the item is not already added' do
      it 'adds the item to the author' do
        author.add_item(book)
        expect(author.items).to include(book)
      end

      it 'calls #add_author on the item' do
        expect(book).to receive(:add_author).with(author)
        author.add_item(book)
      end
    end

    context 'when the item is already added' do
      before { author.add_item(book) }

      it 'does not add the same item twice' do
        author.add_item(book)
        expect(author.items.count(book)).to eq(1)
      end
    end
  end

  describe '#to_hash' do
    let(:book) { double('book', to_hash: { title: 'The Catcher in the Rye' }) }
    let(:author) { Author.new('John', 'Doe', [book]) }

    it 'returns a hash representation of the author' do
      expect(author.to_hash).to eq({
        id: author.id,
        first_name: 'John',
        last_name: 'Doe',
        items: [{ title: 'The Catcher in the Rye' }]
      })
    end
  end
end
