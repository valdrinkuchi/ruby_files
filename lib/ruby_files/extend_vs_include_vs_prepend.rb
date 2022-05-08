# frozen_string_literal: true

# A Robot module
module Animals
  def noise
    p 'Barking...'
  end
end

# A Dog class
class Dog
  extend Animals
end

# Dog.new.noise
# => undefined method `noise' for #<Dog:0x00007f8954166dd8> (NoMethodError)

Dog.noise
# => "Barking..."

# Class Methods

# Employee class
class Employee
  attr_reader :name, :age, :salary

  def initialize(name, age, salary)
    @name = name
    @age = age
    @salary = salary
  end

  def self.validate_id!
    p 'Validating ID...'
  end
end

an_employee = Employee.new('Bob', 31, 100_000)

# This is a singleton method
def an_employee.bonus
  @salary * 0.1
end

p an_employee.bonus
# => 10_000

p an_employee.singleton_class.instance_methods.include?(:bonus)
# => true

p an_employee.class.instance_methods.include?(:bonus)
# => false

p Employee.singleton_class.method_defined?(:validate_id!)
# => true

p Employee.singleton_methods
# => [:validate_id!]

# Include Explanation

# Greeting module
module Greeting
  def hello
    puts 'Hello from module'
  end
end

p Greeting.ancestors

class Person
  # extend Greeting => Would throw an error undefined method `hello' for
  # <Person:0x00007fad8d113d38> (NoMethodError)
  # as when extending the methods are available on as singelton_methods on
  # the class not on the class instance!
  include Greeting
end

first_person = Person.new
first_person.hello
# => 'Hello from module'

p Person.ancestors
# => [Person, Greeting, Object, Kernel, BasicObject]

# Include and extend with one module

# Another Greeting Module
module AnotherGreeting
  # Define class methods in the module
  module ClassMethods
    def hello
      puts 'class hello'
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def hello
    puts 'instance hello'
  end
end

second_person = Person.new
second_person.hello
# => 'instance hello'

Person.hello
# => 'class hello'

# Prepend Explanation
# The prepend behaves similarly to include but it puts the prepended module
# as the first in the ancestors list.

# class Person
  # extend Greeting => Would throw an error undefined method `hello' for
  # <Person:0x00007fad8d113d38> (NoMethodError)
  # as when extending the methods are available on as singelton_methods on
  # the class not on the class instance!
  # prepend Greeting
# end

Person.ancestors
# => [Greeting,Person,Object, Kernel, BasicObject]
