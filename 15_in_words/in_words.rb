class Integer
  
  ONE_DIGIT = {
    0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
    5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine'
  }.freeze

  TEENS = {
    10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
    14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
    17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'
  }.freeze

  TENS = {
    20 => 'twenty', 30 => 'thirty', 40 => 'forty', 50 => 'fifty',
    60 => 'sixty', 70 => 'seventy', 80 => 'eighty', 90 => 'ninety'
  }.freeze

  PREFIXES = {
    1_000_000_000_000 => 'trillion', 1_000_000_000 => 'billion',
    1_000_000 => 'million', 1_000 => 'thousand', 1 => ''
  }.freeze

  def in_words
    number = self
    answer = []

    PREFIXES.keys.each do |prefix|
      value = number / prefix % 1_000
      next if value.zero?

      hundred = value / 100
      ten = value % 100 / 10 * 10

      answer.push(ONE_DIGIT[hundred], 'hundred') unless hundred.zero?
      answer.push(TENS[ten]) unless ten < 20

      if value % 100 > 9 && value % 100 < 20
        answer.push(TEENS[value % 100])
      elsif value % 10 != 0
        answer.push(ONE_DIGIT[value % 10])
      end

      answer.push(PREFIXES[prefix]) unless prefix == 1
    end

    answer = [ONE_DIGIT[0]] if answer.empty?
    answer.join(' ')
  end
end
