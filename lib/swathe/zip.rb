require 'zip/zip'
require 'forwardable'

module Swathe
  class Zip < Archive
    attr_accessor :zip_reader
    include Enumerable

    def initialize(io)
      @zip_reader = ::Zip::ZipFile.open(io)
    end

    def self.open(file_name)
      new(file_name)
    end

    def zip?
      true
    end

    def each(*args, &blk)
      return enum_for(__callee__) unless block_given?
      # zip_reader.each(*args, &blk)
      zip_reader.each(*args) do |entry|
        blk.call(FileInZip.new(entry))
      end
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

  class FileInZip
    attr_reader :entry

    extend Forwardable
    def_delegators :entry, :file?, :directory?

    def initialize(entry)
      @entry = entry
    end

    def full_name
      entry.name
    end

    def read
      entry.get_input_stream.read
    end

  end
end
