class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num <= 0
    sum_of_divisors = (1...num).to_a.select {|n| num % n == 0}.inject(:+)
    return 'perfect' if sum_of_divisors == num
    (sum_of_divisors > num)? 'abundant' : 'deficient'
  end
end
