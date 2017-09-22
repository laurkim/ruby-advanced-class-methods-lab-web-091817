require 'pry'

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
    creation = Song.new
    # binding.pry
    # self.all << creation
    creation.save
    creation
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_to_find)
    self.all.detect { |song| song.name == song_to_find }
  end

  def self.find_or_create_by_name(song_string)
    if !self.find_by_name(song_string)
      self.create_by_name(song_string)
    else
      self.all.detect { |song| song.name == song_string }
      # binding.pry
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name[0] }
  end

  def self.new_from_filename(filename)
    filename_array = filename.split(/[-.]/).map(&:strip).tap(&:pop)
    file_song = filename_array.pop
    # binding.pry
    file_artist = filename_array.first
    new_song = self.new_by_name(file_song)
    new_song.artist_name = file_artist
    new_song
  end

  def self.create_from_filename(filename)
    filename_array = filename.split(/[-.]/).map(&:strip).tap(&:pop)
    file_song = filename_array.pop
    file_artist = filename_array.first
    new_song = self.create_by_name(file_song)
    new_song.artist_name = file_artist
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end


end
