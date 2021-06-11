class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) != nil
      self.find_by_name(song_name)
    else 
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    sorted_array = @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    files = filename.split(" - ")
    song = Song.new
    song.name = files[1].chomp(".mp3")
    song.artist_name = files[0]
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
