class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end 

  def self.new_by_name(name)
     new_song = self.new  
     new_song.name = name 
     new_song 
  end 
  
  def self.create_by_name(name)
    new_song = self.new  
     new_song.name = name 
     @@all << new_song
     new_song
  end 
  
  def self.find_by_name(name)
    song_find_by_name = @@all.find{ |songs| songs.name == name}  
    song_find_by_name
  end 
  
  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end 
    
  def self.alphabetical 
  @@all.sort_by do |names| 
    names.name 
  end 
  end 
  
  def self.new_from_filename(filename)
     song = self.new 
     new_info = filename
     first_half = new_info.split(" - ")
     artist_name = first_half[0] 
     second_half = first_half[1].split(".")
     name = second_half[0]
     song.name = name
     song.artist_name = artist_name
     song 
  end 
  
   def self.create_from_filename(filename)
     song = self.new 
     new_info = filename
     first_half = new_info.split(" - ")
     artist_name = first_half[0] 
     second_half = first_half[1].split(".")
     name = second_half[0]
     song.name = name
     song.artist_name = artist_name
     @@all << song
   end 
   
  def self.destroy_all
    self.all.clear 
  end 
  
end