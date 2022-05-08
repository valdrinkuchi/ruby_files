# frozen_string_literal: true

first_array = %w[a b c]

second_array = first_array.map { |x| x.upcase }

p second_array
# => ["A", "B", "C"]

p first_array.map(&:upcase)
# => ["A", "B", "C"]

another_array = [1, 2, 3, 4, 5]
# Check each element and returns true is the element is odd
another_array.all? { |num| num.odd? }

# odd method is available on the class Fixnum
p another_array.all?(&:odd?)

# Grouping

arr = [34, 12, 23, 45, 9, 8, 43, 56, 23, 34, 5, 2, 1, 10]

p arr.group_by { |num| num.odd? }
# {false=>[34, 12, 8, 56, 34, 2, 10], true=>[23, 45, 9, 43, 23, 5, 1]}

p arr.group_by(&:odd?)
# {false=>[34, 12, 8, 56, 34, 2, 10], true=>[23, 45, 9, 43, 23, 5, 1]}

# Procs

a = -> { 2 * 2 }
p a.call
# => 4

a = proc { |i| i * i }
p a.call(2)
# => 4

# Proc Blcks

my_proc = proc { |letter| letter.upcase }
# %w[a b c].map(my_proc)
# => Will not work as map does not accept arguments. It only accepts blocks.

p %w[a b c].map(&my_proc)

m = method(:puts)
m.call('Hello')
# => "Hello"

%w[a b c].map(&m)
# => "a b c"

# Internally

# Symbol class
class Symbol
  def to_proc
    proc { |obj, *args| obj.send(self, *args) }
  end
end

p %w[a b c].map(&:upcase)
# => ["A", "B", "C"]
