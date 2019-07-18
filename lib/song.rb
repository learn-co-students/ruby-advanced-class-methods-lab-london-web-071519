class Song
  attr_accessor :name, :artist_name, :new_by_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(songName)
    song = self.new
    song.name = songName
    song
  end

  def self.create_by_name(songName)
    song = self.new
    song.name = songName
    song.save
    song
  end

  def self.find_by_name(songName)
    var = @@all.select {|song| song.name == songName ? song.name : false}
    var[0]
  end

  def self.find_or_create_by_name(songName)
    self.find_by_name(songName) ? self.find_by_name(songName) : self.create_by_name(songName)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(songWithFileName)
    song = self.new
    songSplit = songWithFileName.split(/ \- |\.mp3/)
    song.name = songSplit[1]
    song.artist_name = songSplit[0]
    song
  end

  def self.create_from_filename(fileName)
    song = self.new
    songSplit = fileName.split(/ \- |\.mp3/)
    song.name = songSplit[1]
    song.artist_name = songSplit[0]
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
