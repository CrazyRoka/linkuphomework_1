class Temperature
  def initialize(options = {})
    @temperature = if options.include? :f
      ftoc(options[:f])
    elsif options.include? :c
      options[:c]
    else
      0
    end
  end

  def in_fahrenheit
    ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  def self.from_celsius(temperature)
    Celsius.new(temperature)
  end

  def self.from_fahrenheit(temperature)
    Fahrenheit.new(temperature)
  end

  private

  def ftoc(temperature)
    (temperature - 32.0) / 9.0 * 5.0
  end

  def ctof(temperature)
    temperature * 9.0 / 5.0 + 32.0
  end

end

class Celsius < Temperature
  def initialize(temperature)
    @temperature = temperature
  end

  def in_celsius
    @temperature
  end

  def in_fahrenheit
    ctof(@temperature)
  end
end

class Fahrenheit < Temperature
  def initialize(temperature)
    @temperature = temperature
  end

  def in_celsius
    ftoc(@temperature)
  end

  def in_fahrenheit
    @temperature
  end
end