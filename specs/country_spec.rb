require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/continent.rb')
require_relative('../models/country.rb')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestCountry < MiniTest::Test

  def setup
    @continent1 = Continent.new({
      "id" => 1,
      "name" => "Asia",
      "visited" => "t",
      "size" => 45000000
    })
    @country1 = Country.new({
      "id" => 1,
      "name" => "Thailand",
      "visited" => "t",
      "continent_id" => @continent1.id
      })

  end

  def test_get_id
    assert_equal(1, @country1.id)
  end

  def test_get_name
    assert_equal("Thailand", @country1.name)
  end

  def test_get_visited
    assert_equal("t", @country1.visited)
  end

end
