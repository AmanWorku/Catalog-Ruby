require_relative '../game'

RSpec.describe Game do 
    let(:game) {Game.new('N', '2020-01-01', '2022/09/12')}

  describe '#new' do
    it 'Should create a new Game object' do
      expect(game).to be_an_instance_of Game
    end
  end
  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(game).to be_kind_of Item
    end
  end
  describe '#multiplayer' do
    it 'Should return the Multiplayer to be N' do
      expect(game.multiplayer).to eql 'N'
    end
  end
  describe '#last_played' do
    it 'Should return the last played date to be 2020-01-01' do
      expect(game.last_played_at).to eql '2020-01-01'
    end
  end
  describe '#publish_date' do
    it 'Should return the publish date to be 2022/09/12' do
      expect(game.publish_date).to eql '2022/09/12'
    end
  end
  describe '#can_be_archived?' do
    context 'when the game has not been played in more than 2 years' do
      let(:last_played_at) { '2020-01-01' }

      it 'returns true' do
        expect(game.send(:can_be_archived?)).to eq(true)
      end
    end

    context 'when the game has been played in less than 2 years' do
      let(:last_played_at) { '2022-01-01' }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end

    context 'when the game is a new game' do
      let(:publish_date) { Date.today }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to eq(false)
      end
    end
end
end