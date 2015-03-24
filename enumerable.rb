module Enumerable
  def my_each
    i = 0

    while i < self.length
      yield self[i]
      i += 1
    end
  end

  def my_each_with_index
    i = 0

    while i < self.length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    selected_elements = []

    self.my_each do |element|
      selected_elements << element if (yield element) == true
    end
    selected_elements
  end

  def my_all
    self.my_each do |element|
      if (yield element) == false
        return false
      end
      return true
  end
end

[1, 2, 3, 4].my_each { |n| print n }

[1, 2, 3, 4].my_each_with_index { |e, i| print "this is element #{e}, this is its index #{i} \n" }

print [13, 12, 4, 5].my_select { |e| e.even? }

[2, 4, 6, 8].my_all { |e| e.even? }
[3, 4, 6, 8].my_all { |e| e.even? }
