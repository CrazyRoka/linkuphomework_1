class Array
  def square
    self.map { |value|  value * value }
  end

  def square!
    self.map! { |value|  value * value }
  end
end