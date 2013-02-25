# was helpful http://old.thoughtsincomputation.com/posts/tar-and-a-few-feathers-in-ruby
module Swathe
  class Tar < Archive
    attr_accessor :tar_reader
    include Enumerable

    def initialize(tar_reader)
      self.tar_reader = tar_reader
    end

    def self.open(file_name)
      new(Gem::Package::TarReader.new(File.open(file_name)))
    end

    def tar?
      true
    end

    def each
      return enum_for(__callee__) unless block_given?
      tar_reader.rewind
      tar_reader.each {|e| yield(e) }
    end

    def subset
      Enumerator.new do |files|
        each do |entry|
          files << entry if yield(entry)
        end
      end
    end

    def files
      subset {|e| e.file? }
    end

    def directories
      subset {|e| e.directory? }
    end

    def entry(filename)
      detect {|f| filename === f.full_name }
    end
  end
end