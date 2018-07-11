class Temperature
  def initialize(options = {})
    @temperature = options[:c] || ftoc(options[:f])
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

  def ftoc(fahrenheit)
    (fahrenheit - 32) / 9.0 * 5.0
  end

  def ctof(celsius)
    celsius * 9.0 / 5.0 + 32
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
