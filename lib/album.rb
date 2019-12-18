class Album
  attr_reader :name, :id, :year, :genre, :artist, :sold
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, year, genre, artist, sold)
    @album_sold
    @name = name
    @id = id || @@total_rows += 1
    @year = year
    @genre = genre
    @artist = artist
    @sold = sold
    @checked_value
  end

  def self.all
    @@albums.values().sort { |a,b| a.name.downcase() <=> b.name.downcase() }
  end

  def self.search(x)
    @@albums.values.select { |e| /\A#{x}/i =~ e.name}
  end

  def self.sold
    if input.checked_value === "1"
      @sold = true
    else
      @sold = false
    end
  end

  def save
    @@albums [self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist, self.sold)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, year, genre, artist, sold)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
    @sold = sold
  end

  def delete
    @@albums.delete(self.id)
  end
end
