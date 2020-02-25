class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.entries(@path).select {|name| !File.directory?(name) && name.end_with?(".mp3")}
  end

  def import
    files.each {|name| Song.new_by_filename(name)}
  end

end