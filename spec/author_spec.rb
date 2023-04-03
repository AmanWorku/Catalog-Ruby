require 'date'
require_relative '../author'

describe Author do
  let(:author) { Author.new('Salwa', 'Ballouti') }
  let(:game) { double('game') }

  describe '#initialize' do
    it 'should set an id' do
      expect(author.id).to_not be_nil
    end

    it 'should set the first name' do
      expect(author.first_name).to eq('Salwa')
    end

    it 'should set the last name' do
      expect(author.last_name).to eq('Ballouti')
    end

    it 'should set an empty array for items' do
      expect(author.items).to be_empty
    end
  end

  describe '#full_name' do
    it 'should return the full name' do
      expect(author.full_name).to eq('Salwa Ballouti')
    end
  end
end
