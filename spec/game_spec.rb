require_relative '../game'
require_relative '../author'

describe Game do
  let(:title) { 'Test Game' }
  let(:multiplayer) { true }
  let(:last_played_at) { '2022/03/30' }
  let(:publish_date) { '2022/01/01' }
  let(:authors) { [] }

  subject { described_class.new(title, multiplayer, last_played_at, publish_date, authors) }

  describe '#initialize' do
    it 'sets the title' do
      expect(subject.title).to eq(title)
    end

    it 'sets the multiplayer flag' do
      expect(subject.multiplayer).to eq(multiplayer)
    end

    it 'sets the last played at time' do
      expect(subject.last_played_at).to eq(last_played_at)
    end

    it 'sets the publish date' do
      expect(subject.publish_date).to eq(publish_date)
    end

    it 'sets the ID to a random number between 1 and 1000' do
      expect(subject.id).to be_between(1, 1000)
    end

    it 'adds authors to the game' do
      authors = [Author.new('Test Author')]
      game = Game.new(title, multiplayer, last_played_at, publish_date, authors)
      expect(game.authors).to eq(authors)
      expect(authors[0].items).to eq([game])
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the item is older than 2 years' do
      subject.instance_variable_set(:@last_played_at, '2020/03/30')
      expect(subject.send(:can_be_archived?)).to eq(true)
    end
  end

  describe '#to_hash' do
    it 'returns a hash of the game attributes' do
      expected_hash = {
        id: subject.id,
        title: title,
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        publish_date: publish_date,
        author_ids: []
      }
      expect(subject.to_hash).to eq(expected_hash)
    end

    it 'includes author IDs' do
      author = Author.new('Test Author')
      subject.add_author(author)
      expected_hash = {
        id: subject.id,
        title: title,
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        publish_date: publish_date,
        author_ids: [author.id]
      }
      expect(subject.to_hash).to eq(expected_hash)
    end
  end
end
