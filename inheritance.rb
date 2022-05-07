# frozen_string_literal: true

# A food class
class Food
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def parent_description
    "This is a food named #{name} and cost #{price} dollars."
  end
end

# A Fruit class
class Fruit < Food
  attr_reader :color, :weight

  def initialize(color, weight)
    @color = color
    @weight = weight
    name = 'apple'
    price = 10
    super(name, price)
  end

  def description
    "I am a #{@color} #{@name} and I weigh #{@weight} kg."
  end
end

p Fruit.new('red', 15).parent_description
