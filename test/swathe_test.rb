require_relative 'minitest_helper'

class TestSwathe < MiniTest::Unit::TestCase
  def setup
  end

  def test_that_kitty_can_eat
    assert_kind_of Module, Swathe
  end
end
