# input: num
# output: sum of the multiples of a given num (3 and 5 if none are give) but not including num
# data structure arr and integer 
# # rules: one is counted, but not num itself

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def self.to(limit)
    (1..limit).to_a.inject(0) do |total, num|
      if (num % 3 == 0 || num % 5 == 0) && num != limit
        total += num
      else
        total += 0
      end
    end
  end

  def to(limit)
    (1..limit).to_a.inject(0) do |total, num|
      if part_of_multiples?(num) && num != limit
        total += num
      else
        total += 0
      end
    end
  end

  def part_of_multiples?(num)
    @multiples.each do |multiple|
      return true if num % multiple == 0
    end
    false
  end
end