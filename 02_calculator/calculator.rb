def add(first_num, second_num)
  first_num + second_num
end

def subtract(first_num, second_num)
  first_num - second_num
end

def sum(array)
  array.sum
end

def power(first_num, second_num)
  first_num**second_num
end

def multiply(first_num, second_num, *array)
  first_num * second_num * array.reduce(1, :*)
end

def factorial(number)
  (1..number).reduce(1, :*)
end