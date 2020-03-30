class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 unless valid_octal?(octal)
    octal_arr = octal.chars.map(&:to_i)
    power = 0
    octal_arr.reverse.inject do |total, num|
      power += 1
      total + (num * (8**(power)))
    end
  end

  def valid_octal?(string)
    !(string =~ /\D|[8|9]/)
  end

  private
  attr_reader :octal
end
