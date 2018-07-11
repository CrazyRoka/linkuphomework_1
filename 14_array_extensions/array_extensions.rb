class Array
  SQUARE = proc { |value| value * value }

  def square
    map(&SQUARE)
  end

  def square!
    map!(&SQUARE)
  end
end
