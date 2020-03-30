class Sieve
  attr_reader :primes
  def initialize(limit)
    @limit = limit
    @primes = find_primes
  end

  private

  attr_reader :limit

  def find_primes
    ret_arr = (2..limit).to_a
    ret_arr.map do |num|
      ((num + 1)..limit).each do |num2|
        ret_arr.delete(num2) if num2 % num == 0
      end
      num
    end
  end
end