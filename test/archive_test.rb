require_relative 'minitest_helper'

class TestArchive < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_kitty_can_eat
    assert_kind_of Class, Swathe::Archive
  end

  def test_archive_open
    gz = Swathe::Archive.open("#{samples_path}/sample.tgz")
    assert gz.gzip?
  end
end
