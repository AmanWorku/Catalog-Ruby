require_relative '../music_album'

RSpec.describe MusicAlbum do
  before do
    @music_album = MusicAlbum.new('Hotel California', '1976-12-08', on_spotify: true)
  end

  it 'Check if it is an instance of the class' do
    expect(@music_album).to be_instance_of MusicAlbum
  end

  it 'Check if it has a name attribute' do
    expect(@music_album.name).to eq 'Hotel California'
  end

  it 'Check if it has a publish date attribute' do
    expect(@music_album.publish_date).to eq Date.parse('1976-12-08')
  end

  it 'Check if it can be archived when on_spotify is true' do
    expect(@music_album.can_be_archived?).to be true
  end

  it 'Check if it cannot be archived when on_spotify is false' do
    music_album = MusicAlbum.new('Abbey Road', '1969-09-26', on_spotify: false)
    expect(music_album.can_be_archived?).to be false
  end
end
