class OCR

  OCR_HSH = {
            "246" => "0", "033" => "1", "253" => "2", "255" => '3', "063" => '4',
            "235" => '5', "236" => "6", "233" => "7", "266" => "8", "265" => "9"
            }

  OCR_HSH.default = '?'


  def initialize(digital_numbers)
    @digital_numbers = digital_numbers
  end

  def convert
    split_to_batches.map do |batch|
      horizontal_lines = split_horizontally(batch)
      digital_numbers = match_horizontal_lines(horizontal_lines)
      digital_numbers.inject('') do |total, digital_number|
        digit_key = encode(digital_number)
        total + OCR_HSH[digit_key]
      end
    end.join(',')
  end

  def split_to_batches
    @digital_numbers.split(/\n\n/)
  end

  def split_horizontally(batch)
    batch.split("\n").map do |line|
      start_point = 0
      horizontal_lines = []
      loop do
        horizontal_lines << line[start_point, 3]
        break if start_point + 3 >= line.size
        start_point += 3
      end
      horizontal_lines
    end
  end

  def match_horizontal_lines(horizontal_lines)
    matched_digits = []
    horizontal_lines.each do |line|
      line.size.times do |idx|
        if matched_digits[idx].nil?
        matched_digits << [line[idx]] if matched_digits[idx].nil?
        else
          matched_digits[idx] << line[idx]
        end
      end
    end
    matched_digits
  end

  def encode(digital_number)
    digital_number.map do |horizontal_string|
      counter = 1
      horizontal_string.chars.inject(0) do |total, char|
        total += counter if char.match?(/[_\|]/)
        counter += 1
        total
      end
    end.map(&:to_s).join
  end
end
