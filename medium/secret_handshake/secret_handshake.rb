=begin

Problem:
Convert decimals into a hand shake
1 = wink = 0
10 = double blink = 1
100 = close your eyes = 2
1000 = jump = 3
10000 = do sequence in reverse = 4

Trick is converting to binary, determining sequence, reversing sequence
What kind of inputs: strings, integers, strings that are not made up of numerals are 
    considered invalid binaries

Sequence is from the ones place, ascending

How to convert decimal to binary

1. check if input is a string or integer
  - change input into a string
  - check if string
    - has any non numeral char, return [] if true
  - check if string contains any number above 1
    - if so convert it to a binary string
2. Create a return arr
3. split & reverse binary string into chars the iterate thru them 
  - keep track of their index
  - if char is 1 and index is 4 call reverse on return arr
  - if char is 1 add lookup[index] to return arr

1. convert string num to binary
    - convert string num to int
    - create return_binary
    - divided_num = string num
    - loop and break if divided num is 0

=end

class SecretHandshake

  HANDSHAKE_DECODER = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(code)
    @secret_code = code
  end

  def commands
    message = @secret_code.to_s
    return [] if message.match?(/[^0-9]/)
    message = to_binary(message) if message.match?(/[2-9]/)
    return_commands = []
    message.to_s.chars.reverse.each_with_index do |num, idx|
      break return_commands.reverse! if idx == 4 && num == '1'
      return_commands << HANDSHAKE_DECODER[idx] if num == '1'
    end
    return_commands
  end

  def to_binary(string_num)
    dividend = string_num.to_i
    return_binary = []
    loop do
      break if dividend == 0
      return_binary.unshift(dividend % 2)
      dividend = dividend / 2
    end
    return_binary.join.to_i
  end
end
