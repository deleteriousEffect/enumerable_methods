# Rebuilds of the Ruby Enumerable Methods
module Enumerable
  def my_each
    i = 0

    while i < length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0

    while i < length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    selected_elements = []

    my_each do |element|
      selected_elements << element if (yield element) == true
    end
    selected_elements
  end

  def my_all
    my_each do |element|
      return false if (yield element) == false
      return true
    end
  end

  def my_any
    my_each do |element|
      return true if (yield element) == true
    end
    false
  end

  def my_none
    my_each do |element|
      return false if (yield element) == true
    end
    true
  end

  def my_count(match = nil)
    count = 0

    if !match.nil?
      my_each do |element|
        count += 1 if element == match
      end
    elsif block_given?
      my_each do |element|
        count += 1 if (yield element) == true
      end
    else count = length
    end
    count
  end

  def my_map(proc)
    i = 0

    my_each do |element|
      self[i] = proc.call(element)
      self[i] = yield self[i] if block_given?
      i += 1
    end
    self
  end

  def my_inject
    i = 1
    accumulator = self[0]
    while i < length
      accumulator = (yield accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

[1, 2, 3, 4].my_each { |n| print n }

[1, 2, 3, 4].my_each_with_index do |e, i|
  print "this is element #{e}, this is its index #{i} \n"
end

print [13, 12, 4, 5].my_select(&:even?)

puts [2, 4, 6, 8].my_all(&:even?)
puts [3, 4, 6, 8].my_all(&:even?)

puts [1, 2, 3, 4].my_any(&:even?)
puts [1, 1, 1, 1].my_any(&:even?)

puts [1, 1, 1, 1].my_none(&:even?)
puts [1, 2, 3, 4].my_none(&:even?)

puts [1, 2, 3, 4, 4].my_count(&:even?)
puts [1, 2, 3, 4, 4].my_count(4)
puts [1, 2, 3, 4, 4].my_count

#puts [1, 2, 3, 4].my_map { 'hello' }
#puts [1, 2, 3, 4].my_map { |e| e + e }

puts [1, 2, 3, 4].my_inject { |acc, ele| acc + ele }

double = Proc.new { |e| e + e }

puts [1, 2, 3, 4].my_map(double)
puts [1, 2, 3, 4].my_map(double) { |e| e - 1 }
