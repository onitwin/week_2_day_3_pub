require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drinks.rb')



class DrinksTest < MiniTest::Test

  def setup
    @drink1=Beverage.new("Ale",3,2)
  end


  def test_check_name
    assert_equal('Ale',@drink1.name)
  end

  def test_check_price
    assert_equal(3,@drink1.price)
  end

  def test_check_strength
    assert_equal(2,@drink1.strength)
  end





end
