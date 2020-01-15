require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub.rb')
require_relative('../drinks')
require_relative('../customer')



class PubTest < MiniTest::Test

  def setup()
    @pub=Pub.new("Greyhawk Inn",100)
    @drink1=Beverage.new('Beer',4,5)
    @drink5=Beverage.new('Whisky',10,15)
    @drink3=Beverage.new('Vodka',3,7)
    @cust1=Customer.new("Sol",80,38)
    @cust2=Customer.new('Moon',200,12)
  end

  def test_check_name
    assert_equal("Greyhawk Inn",@pub.name)
  end

  # def test_get_name
  #   return @name
  # end

  def test_check_till
    assert_equal(100,@pub.till)
  end

  # def test_get_till_balance_method
  #   assert_equal(100,@pub.get_till_balance)
  # end

  def test_check_stock_length
    assert_equal(0,@pub.stock.length)
  end

  def test_add_stock#check stock is 0 then add item, check again, add item, check again
    assert_equal(0,@pub.stock.length)
    @pub.add_stock(@drink1)
    assert_equal(1,@pub.stock.length)
    @pub.add_stock(@drink5)
    assert_equal(2,@pub.stock.length)
  end

  def test_remove_stock
    @pub.add_stock(@drink1)
    @pub.add_stock(@drink1)
    @pub.add_stock(@drink1)
    assert_equal(3,@pub.stock.length)#worked till here
    @pub.remove_stock()
    assert_equal(2,@pub.stock.length)
    @pub.remove_stock
    assert_equal(1,@pub.stock.length)
  end

  def test_add_to_till
    @pub.add_to_till(@drink1)
    assert_equal(104,@pub.till)
  end

  def test_age_check_pass
    assert_equal(true,@pub.age_check(@cust1))
  end

  def test_age_check_fail
    assert_equal(false,@pub.age_check(@cust2))
  end

  def test_drunken_fail
    @cust1.buy_drink(@drink5)
    @cust1.buy_drink(@drink5)
    @cust1.buy_drink(@drink5)
    @cust1.buy_drink(@drink5)
    assert_equal(false,@pub.drunkeness_check(@cust1))
  end

  def test_drunken_pass
    @cust1.buy_drink(@drink5)
    assert_equal(true,@pub.drunkenness_check(@cust1))
  end











end
