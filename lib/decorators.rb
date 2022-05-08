# frozen_string_literal: true

# Person class
class Person
  def feeling_at(outside_temp)
    if outside_temp > 20
      'Warm'
    else
      'Cold'
    end
  end
end

# Shirt class
class Shirt
  def initialize(person)
    @person = person
  end

  def feeling_at(outside_temp)
    if outside_temp >= 30
      'Going for a swim'
    else
      @person.feeling_at(outside_temp)
    end
  end
end

# Coat class
class Coat
  def initialize(person)
    @person = person
  end

  def feeling_at(outside_temp)
    if outside_temp >= 35
      'Crazy hot'
    else
      @person.feeling_at(outside_temp)
    end
  end
end

# You need to take care of the object's entire interface.
# It doesn't address the "transparent interface" requirement.
outside_temp = 30

joe = Person.new
p joe.feeling_at(outside_temp)

joe_shirt = Shirt.new(joe)
p joe_shirt.feeling_at(outside_temp)

joe_coat = Coat.new(joe_shirt)
p joe_coat.feeling_at(outside_temp)

p "Class: #{joe_coat.class}"

# A better way would be to Decorate the objects uisng moduels.

# Pizza class
class Pizza
  def cost
    2.0
  end

  def foo
    'foo'
  end
end

# Onions module
module OnionsDecorator
  def cost
    super + 1.0
  end
end

# Cheese module
module CheeseDecorator
  def cost
    super + 2.2
  end
end

# We can only extend the object once.
pizza = Pizza.new
pizza.extend(OnionsDecorator)
pizza.extend(CheeseDecorator)

puts "Your pizza costs: #{pizza.cost}"
# puts "Class: #{pizza.class}"
