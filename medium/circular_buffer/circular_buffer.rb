# Top level class
class CircularBuffer
  BufferEmptyException = IndexError
  BufferFullException = IndexError

  def initialize(max_buffer_size)
    @max_buffer_size = max_buffer_size
    @buffer = []
  end

  def write(item)
    return '' if item.nil?
    raise BufferFullException if @buffer.size >= @max_buffer_size
    @buffer.unshift(item)
  end

  def write!(item)
    return '' if item.nil?
    @buffer.delete_at(-1) if @buffer.size >= @max_buffer_size
    write(item)
  end

  def read
    raise BufferEmptyException if @buffer[-1].nil?
    @buffer.pop
  end

  def clear
    @buffer = []
  end
end
