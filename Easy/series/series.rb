class Series
  def initialize(string_num)
    @arr_num = string_num.chars.map(&:to_i)
  end

  def slices(arr_slice)
    raise ArgumentError if arr_slice > arr_num.size
    start_pos = 0
    end_pos = (arr_slice - 1)
    ret_arr = []
    loop do
      break if end_pos >= arr_num.size
      ret_arr << arr_num[start_pos..end_pos]
      start_pos += 1
      end_pos += 1
    end
    ret_arr
  end

  private
  attr_reader :arr_num
end