class MusicLibraryController
  attr_accessor :music_importer
  def initialize(path= './db/mp3s')
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets
    while input != 'exit'
      input = gets
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        song = gets
        play_song(gets)
      when 'exit'

      else
        puts "What would you like to do?"
      end
    end
  end

  def list_songs # "1. artist - song - genre"
    sorted_songs = Song.all.sort_by {|song| song.name}

    # alphabatize
    # the print from array
    puts "#{line_number}. #{artist} - #{song} - #{genre}"
  end

  def list_artists
  end

  def list_genres
  end

  def list_songs_by_artist
  end

  def list_songs_by_genre
  end

  def play_song(song_name)
  end
end
