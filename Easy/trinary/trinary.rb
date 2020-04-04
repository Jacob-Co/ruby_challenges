class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 unless valid_trinary?
    arr_trinary = trinary.chars.map(&:to_i).reverse
    power = 0
    arr_trinary.inject do |total, num|
      power += 1
      total += num*(3**power)
    end
  end

  def valid_trinary?
    !(trinary =~ /\D|[3-9]/)
  end

  private
  attr_reader :trinary
end