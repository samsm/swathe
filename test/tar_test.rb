require_relative 'minitest_helper'

class TestTarIntegration < MiniTest::Unit::TestCase

  def tar(path = "#{samples_path}/tar_with_directory.tar")
    @tar ||= Swathe::Tar.open(path)
  end

  def test_works
    assert tar.tar?
  end

  def test_file_count
    assert_equal 1, tar.files.count
  end

  def test_file_list
    assert_equal ["samples/file.txt"], tar.files.collect(&:full_name)
  end

  def test_directory_list
    assert_equal ["samples/"], tar.directories.collect(&:full_name)
  end

end