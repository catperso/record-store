class Song
  attr_reader :id
  attr_accessor :name, :album_id, :lyrics

  @@songs = {}
  @@total_rows = 0

  def initialize(name, album_id, id, lyrics)
    @name = name
    @album_id = album_id
    @id = id || @@total_rows += 1
    @lyrics = lyrics
  end

  def ==(song_to_compare)
    (self.name() == song_to_compare.name()) && (self.album_id() == song_to_compare.album_id()) && (self.lyrics() == song_to_compare.lyrics())
  end

  def self.all
    @@songs.values
  end

  def save
    @@songs[self.id] = Song.new(self.name, self.album_id, self.id, self.lyrics)
  end

  def self.find(id)
    @@songs[id]
  end

  def update(name, album_id, lyrics)
    if name.length > 0
      self.name = name
    end
    self.album_id = album_id
    if lyrics.length > 0
      self.lyrics = lyrics
    end
    @@songs[self.id] = Song.new(self.name, self.album_id, self.id, self.lyrics)
  end

  def delete
    @@songs.delete(self.id)
  end

  def self.clear
    @@songs = {}
  end

  def self.find_by_album(alb_id)
    songs = []
    @@songs.values.each do |song|
      if song.album_id == alb_id
        songs.push(song)
      end
    end
    songs
  end

  def album
    Album.find(self.album_id)
  end

  def self.sort
    array = @@songs.values.sort_by! &:name
    @@songs = {}
    array.each do |element|
      @@songs[element.id] = element
    end
  end
end