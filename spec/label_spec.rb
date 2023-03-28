require_relative '../label'

RSpec.describe Label do
  let(:label) { Label.new('Gift', 'Best') }

  describe '#new' do
    it 'Should create a new Label object' do
      expect(label).to be_an_instance_of Label
    end
  end
  describe '#Item_kind' do
    it 'Should be a kind of Item' do
      expect(label).to be_kind_of Item
    end
  end
  describe '#title' do
    it 'Should return the publisher to be Gift' do
      expect(label.title).to eq 'Gift'
    end
  end
  describe '#cover_state' do
    it 'Should return the cover state to be best' do
      expect(book.cover_state).to eq 'Best'
    end
  end
end
