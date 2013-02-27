require_relative 'minitest_helper'

class TestGzipIntegration < MiniTest::Unit::TestCase

  def gzip(path = "#{samples_path}/sample.tgz")
    @gzip ||= Swathe::Gzip.open(path)
  end

  def test_is_a_gzip
    assert gzip.gzip?
  end

  def test_has_a_tar
    assert gzip.tar.tar?
  end

  def test_read_file
    assert_match %r(This is a sample file to test extraction), gzip.entry('file.txt').read
  end

end