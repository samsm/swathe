require_relative 'minitest_helper'

class TestExtractorIntegration < MiniTest::Unit::TestCase
  def teardown
    FileUtils.rm_r(Dir.glob("#{cleanup_path}*"))
  end

  def extractor(path = "#{samples_path}/tar_with_directory.tar")
    @extractor ||= Swathe::Tar.open(path).extractor
  end

  def cleanup_path
    "#{Swathe.project_root}/tmp/"
  end

  def test_write_file
    extractor.extract('samples/file.txt', 'tmp/')
    assert File.exists?("tmp/samples/file.txt")
  end

end