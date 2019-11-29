require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/continent.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestContinent < MiniTest::Test

  def setup
    @continent1 = Continent.new({
      "id" => 1,
      "name" => "Asia",
      "visited" => "t",
      "size" => 45000000
    })
  end

  def test_get_id
    assert_equal(1, @continent1.id)
  end

  def test_get_name
    assert_equal("Asia", @continent1.name)
  end

  def test_get_visited
    assert_equal("t", @continent1.visited)
  end

  def test_get_size
    assert_equal(45000000, @continent1.size)
  end


end
