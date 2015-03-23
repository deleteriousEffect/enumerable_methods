module Enumerable
  def my_each
    i = 0
    self_len = self.length

    while i < self_len
      yield self[i]
      i += 1
    end
  end
end

[1, 2, 3, 4].my_each { |n| print n }
