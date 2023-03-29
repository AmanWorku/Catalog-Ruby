require_relative '../label'

RSpec.describe Label do
  let(:label) { Label.new('Gift', 'Red') }

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
    it 'Should return the title to be Gift' do
      expect(label.title).to eq 'Gift'
    end
  end
  describe '#color' do
    it 'Should return the color to be Red' do
      expect(label.color).to eq 'Red'
    end
  end
end
