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
end

[1, 2, 3, 4].my_each { |n| print n }

[1, 2, 3, 4].my_each_with_index { |e, i| print "this is element #{e}, this is its index #{i} \n" }
