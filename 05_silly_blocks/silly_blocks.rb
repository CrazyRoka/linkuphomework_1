def reverser
  yield.gsub(/\w+/) { |word| word.reverse }
end

def adder(value = 1)
  yield + value
end

def repeater(repetitions_number = 1)
  repetitions_number.times { yield }
end
