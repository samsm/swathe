require 'zlib'

module Swathe
  class Gzip < Archive
    attr_accessor :gzip_reader

    extend Forwardable
    def_delegators :tar, :entry, :each, :files, :directories

    def initialize(io)
      self.gzip_reader = Zlib::GzipReader.open(io)
    end

    def self.open(filename)
      new(File.open(filename))
    end

    def gzip?
      true
    end

    def tar
      if contains_tar?
        @tar ||= Tar.new(gzip_reader)
      else
        # Need something that acts like an archive of one file.
      end
    end

    def contains_tar?
      (%r(\.tar\Z) === gzip_reader.orig_name) ||
      (%r(\.tgz\Z) === File.extname(gzip_reader.path))
    end

    def each(*args)
      return enum_for(__callee__) unless block_given?
      tar ? tar.each(*args) : [gzip_reader].each(*args)
    end

    def self.gzip?(file)
      begin
        Zlib::GzipReader.open(file)
      rescue Zlib::GzipFile::Error
        false
      end
    end

  end
end