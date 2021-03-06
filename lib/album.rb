class Album
  attr_accessor :id, :name, :genre, :year, :artist, :search, :sold

  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, genre, year, artist)
    @name = name
    @id = id || @@total_rows += 1
    @genre = genre
    @year = year
    @artist = artist
    @searched = true
    @sold = false
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

  def self.search(word_searched)
    new_array = []
    @@albums.values.each do |album|
      if album.name == word_searched || album.genre == word_searched || album.year == word_searched || album.artist == word_searched
        new_array.push(album)
      end
    end
    new_array
  end

  def self.sold(name_searched)
    sold_array = []
    @@albums.values.each do |album|
      if album.name == name_searched
        album.sold = true
        sold_array.push(album)
      end
    end
    sold_array
  end

  def self.sort
    array = @@albums.values.sort_by! &:name
    @@albums = {}
    array.each do |element|
      @@albums[element.id] = element
    end
  end

  def songs
    Song.find_by_album(self.id)
  end
  
end

#sold method
#sorting sold albums