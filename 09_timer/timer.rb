class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    self.seconds = seconds.to_f
  end

  def time_string
    hours = padded(@seconds / 60 / 60 % 24)
    minutes = padded(@seconds / 60 % 60)
    seconds = padded(@seconds % 60)
    "#{hours}:#{minutes}:#{seconds}"
  end

  def padded(number)
    '%0.2d' % number
  end

end
