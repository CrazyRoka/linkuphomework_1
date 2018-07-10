class RPNCalculator
  attr_reader :value

  def initialize
    @stack = []
  end

  def push(val)
    @stack << val
  end

  def perform_operation(operation)
    raise "calculator is empty" if @stack.size < 2
    number = @stack.pop
    @stack[-1] = @stack[-1].send(operation, number.to_f)
    @value = @stack[-1]
  end

  def plus
    perform_operation(:+)
  end

  def minus
    perform_operation(:-)
  end

  def divide
    perform_operation(:/)
  end

  def times
    perform_operation(:*)
  end

  def tokens(expression)
    expression.split.map do |value|
      value.scan(/\D/).empty? ? value.to_i : value.to_sym
    end
  end

  def evaluate(expression)
    expression = tokens(expression)
    expression.each do |value|
      if value.is_a? Integer
        push(value)
      else
        perform_operation(value)
      end
    end
    @value
  end
end
