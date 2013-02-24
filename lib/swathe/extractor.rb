require 'fileutils'

module Swathe
  class Extractor
    attr_accessor :source, :default_destination
    def initialize(source, default_destination = '.')
      self.source = source
      self.default_destination = default_destination
    end

    # Needs edit: Doesn't have to be a file.
    def extract(filename, destination = nil)
      # Need to make this able to ignore the file's path if need be.
      base_destination_directory = destination || default_destination
      entry = source.file(filename)
      if entry
        target = "#{base_destination_directory}/#{entry.full_name}"
        ensure_target_directory_exists_for(target)
        File.open target, "wb" do |f|
          entry.read
        end
      end
    end

    def ensure_target_directory_exists_for(path)
      target_directory = File.dirname(path)
      FileUtils.mkdir_p(target_directory) unless File.directory?(target_directory)
    end
  end
end