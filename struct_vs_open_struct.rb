# frozen_string_literal: true

Person = Struct.new(:name, :age, :gender)

john = Person.new('John', 30, 'M')
second_john = Person.new('John', 30, 'M')
p john
# => #<struct Person name="John", age=30, gender="M">

# Comparison based in attributes
p john == second_john
# => true

# They won't enforce the correct number of arguments for the constructor!

p Person.new('peter')
# => #<struct Person name="peter", age=nil, gender=nil>

p Struct.new(:a).ancestors
# => [#<Class:0x00007faf0f851d60>, Struct, Enumerable, Object, Kernel, BasicObject]
# enumerable module, which allows you to call methods like each & map

# Ruby 2.5 added support for keywords arguments in Struct objects.

LogEntry = Struct.new(:status, :url, :time, keyword_init: true)
p LogEntry.new(status: 200, url: '/books', time: '18:04')
# => #<struct LogEntry status=200, url="/books", time="18:04">

# How to Use OpenStruct

require 'ostruct'

cat = OpenStruct.new(color: 'black')
p cat.class
p cat.color
# => OpenStruct
# => black

# Struct vs OpenStruct
# The difference between Struct & OpenStruct:

# Struct creates a new class with predefined attributes, equality method (==) & enumerable
# OpenStruct creates a new object with the given attributes
