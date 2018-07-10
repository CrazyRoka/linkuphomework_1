class Array
  def square
    map { |value| value * value }
  end

  def square!
    map! { |value| value * value }
  end
end
