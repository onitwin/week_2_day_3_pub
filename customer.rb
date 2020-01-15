class Customer
  attr_reader :name , :wallet ,:age , :drunkenness

  def initialize(name,wallet,age)
    @name=name
    @wallet=wallet
    @age=age
    @drunkenness=0
  end

  def buy_drink(drink)
    @wallet-=(drink.price)
    @drunkenness +=(drink.strength)
  end

  def purchase(pub,drink,cust)
    if pub.age_check(cust) && pub.drunkenness_check(cust)
      buy_drink(drink)
      pub.add_to_till(drink)
    end
  end



















end
