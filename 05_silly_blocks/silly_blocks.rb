def reverser
  yield.gsub(/\b\w+\b/) { |word| word.reverse }
end

def adder(value = 1)
  yield + value
end

def repeater(number_of_repetitions = 1)
  number_of_repetitions.times { yield }
end