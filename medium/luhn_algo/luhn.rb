class Luhn
  def initialize(input_num)
    @input_num = input_num
  end

  def addends
    input_numbers = @input_num.to_s.chars.map(&:to_i)
    input_numbers.reverse.map.with_index do |num, idx|
      num *= 2 if idx.odd?
      num -= 9 if num >= 10
      num
    end.reverse
  end

  def checksum
    addends.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(starting_num)
    if self.new(starting_num).valid?
      starting_num
    else
      starting_num *= 10
      loop do
        break if self.new(starting_num).valid?
        starting_num += 1
      end
    end
    starting_num
  end

end
