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
    song = self.new
    @@all << song
    song
  end 
  
  def self.new_by_name (name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name (name)
    song = self.new 
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name (name)
    @@all.find do |n|
      n.name == name
    end 
  end 
  
  def self.find_or_create_by_name (name)  
    if (self.find_by_name(name) == nil)
      self.create_by_name (name)
    else 
      self.find_by_name (name)
    end 
  end 
  
  def self.alphabetical
     @@all.sort_by {|s| s.name }
  end 
  
  def self.new_from_filename (song)
    song_array = []
    song_array = song.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    new_song = self.new
    new_song.name = song_array[0]
    new_song.artist_name = song_array[1]
    new_song.name
  end 

end
