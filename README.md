# Swathe

An archive extraction tool. Intends to support tar, zip, tgz, etc without much fuss.

Presently crude ... but effective? Maybe!

## Installation

    gem 'swathe'

## Usage

    # This should work from the root of this checked out project.
    %w(tar tgz zip).each do |archive_type|
      archive = Swathe::Archive.open("samples/sample.#{archive_type}")
      puts "Opening: sample.#{archive_type}"
      puts "First file is #{archive.first.full_name}"
      p "Contents are: #{archive.first.read}"
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
