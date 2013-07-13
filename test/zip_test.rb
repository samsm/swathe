require_relative 'minitest_helper'

class TestZipIntegration < MiniTest::Unit::TestCase

  def zip(path = "#{samples_path}/sample.zip")
    @zip ||= Swathe::Zip.open(path)
  end

  def test_is_a_zip
    assert zip.zip?
  end

  def test_file_count
    assert_equal 1, zip.files.count
  end

  def test_file_list
    assert_equal ["samples/file.txt"], zip.files.collect(&:full_name)
  end

  # TODO: Apparently zip directories don't work this way.
  # Or I screwed up the sample zip. Figure this out.
  # def test_directory_list
  #   assert_equal ["samples/"], zip.directories.collect(&:full_name)
  # end

  def test_read_file
    assert_match %r(This is a sample file to test extraction), zip.entry('samples/file.txt').read
  end

end