class Timer

  def initialize(seconds = 0)
    self.seconds = seconds.to_f
  end

  def seconds
    @seconds
  end

  def seconds=(seconds)
    @seconds = seconds
  end

  def time_string
    "#{padded(@seconds / 60 / 60 % 24)}:#{padded(@seconds / 60 % 60)}:#{padded(@seconds % 60)}"
  end

  def padded(number)
    '%0.2d' % number
  end

end