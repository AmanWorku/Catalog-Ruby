require_relative '../genre'
require_relative '../music_album'

RSpec.describe Genre do
  before :each do
    @genre = Genre.new('Rock')
    @music_album = MusicAlbum.new('Hotel California', '1976-12-08', on_spotify: true)
  end

  it 'instance is an instance of the class' do
    expect(@genre).to be_instance_of Genre
  end

  it 'has a name attribute' do
    expect(@genre.name).to eq 'Rock'
  end

  it 'has an items attribute' do
    expect(@genre.items).to eq []
  end

  it 'can add an item to its collection' do
    @genre.add_item(@music_album)
    expect(@genre.items).to include @music_album
  end

  it 'adds itself as the item\'s genre' do
    @genre.add_item(@music_album)
    expect(@music_album.genre).to eq @genre
  end

  it 'adds the item to its items collection when adding the item' do
    @genre.add_item(@music_album)
    expect(@genre.items).to include @music_album
  end

  it 'adds itself to the item\'s genres collection when adding the item' do
    @genre.add_item(@music_album)
    expect(@music_album.genres).to include @genre
  end
end
