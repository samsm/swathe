require 'zlib'
require 'forwardable'

module Swathe
  class Gzip < Archive
    attr_accessor :gzip_reader

    extend Forwardable
    def_delegators :tar, :entry, :each, :files, :directories
    include Enumerable

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

    def each(*args, &blk)
      return enum_for(__callee__) unless block_given?
      contains_tar? ?  tar.each(*args, &blk) : [gzip_reader].each(*args, &blk)
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