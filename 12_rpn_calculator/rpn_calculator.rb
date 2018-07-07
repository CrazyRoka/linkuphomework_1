class RPNCalculator
  def initialize
    @stack = []
  end

  def push(val)
    @stack << val
  end

  def plus
    raise "calculator is empty" if @stack.size < 2
    number = @stack.pop
    @stack[-1] += number
    @value = @stack[-1]
  end

  def minus
    raise "calculator is empty" if @stack.size < 2
    number = @stack.pop
    @stack[-1] -= number
    @value = @stack[-1]
  end

  def divide
    raise "calculator is empty" if @stack.size < 2
    number = @stack.pop
    @stack[-1] /= number.to_f
    @value = @stack[-1]
  end

  def times
    raise "calculator is empty" if @stack.size < 2
    number = @stack.pop
    @stack[-1] *= number
    @value = @stack[-1]
  end

  def value
    @value
  end

  def tokens(expression)
    expression.split.map {|value| value.to_i.to_s == value ? value.to_i : value.to_sym }
  end

  def evaluate(expression)
    expression = tokens(expression)
    expression.each do |value|
      case value
      when Integer
        push(value)
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        raise "Undefined operation"
      end
    end
    @value
  end
end