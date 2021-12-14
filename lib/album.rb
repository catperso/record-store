class Album
  attr_accessor :id, :name, :genre, :year, :artist

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, genre, year, artist)
    @name = name
    @id = id || @@total_rows += 1
    @genre = genre
    @year = year
    @artist = artist
  end

  def self.all
    @@albums.values()
  end

  def self.find(id)
    @@albums[id]
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.genre, self.year, self.artist)
  end

  def ==(other_album)
    self.name.eql?(other_album.name)
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def update(name, genre, year, artist)
    if name.length > 0
      @name = name
    end
    if genre.length > 0
      @genre = genre
    end
    if year.length > 0
      @year = year
    end
    if artist.length > 0
      @artist = artist
    end
  end

  def delete
    @@albums.delete(self.id)
  end

  def search(word)
    if (@name == word) || (@genre == word) || (@year == word) || (@artist == word)
      true
    else
      false
    end
  end
  
end