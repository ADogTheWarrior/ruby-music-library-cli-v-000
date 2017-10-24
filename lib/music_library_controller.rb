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
        puts "Please enter the name of an artist:"
        # artist = gets
        list_songs_by_artist(gets)
      when 'list genre'
        puts "Please enter the name of a genre:"
        # genre = gets
        list_songs_by_genre(gets)
      when 'play song'
        # song = gets
        play_song(gets)
      when 'exit'

      else
        puts "What would you like to do?"
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, line_number|
      puts "#{line_number+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index do |artist, line_number|
      puts "#{line_number+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted_genre = Genre.all.sort_by {|genre| genre.name}
    sorted_genre.each_with_index do |genre, line_number|
      puts "#{line_number+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist(artist_name)
    artist = Artist.find_by_name(artist_name)
    if artist == nil
      return nil
    end
    sorted_songs = artist.songs.sort_by{|songs| songs.name}
    sorted_songs.each_with_index do |song, line_number|
      puts "#{line_number+1}. #{song.name}"
    end
  end

  def list_songs_by_genre(genre_name)
  end

  def play_song(song_name)
  end
end

mlc = MusicLibraryController.new
mlc.call
