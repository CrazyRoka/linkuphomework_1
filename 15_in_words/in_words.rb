class Integer

  def in_words
    number = self
    answer = []

    EXTENSIONS.keys.each do |extension|
      # split number into 3 digits pieces
      value = number / extension % 1_000
      next if value.zero?

      answer += make_phrase(value, extension)
    end
    # zero case
    answer = [ONE_DIGIT[0]] if answer.empty?
    answer.join(' ')
  end

  private

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

  EXTENSIONS = {
    1_000_000_000_000 => 'trillion', 1_000_000_000 => 'billion',
    1_000_000 => 'million', 1_000 => 'thousand', 1 => ''
  }.freeze

  def make_phrase(value, extension)
    words = []

    # hundreds
    hundred = value / 100
    words.push(ONE_DIGIT[hundred], 'hundred') unless hundred.zero?

    # tens
    ten = value % 100 / 10 * 10
    words.push(TENS[ten]) unless ten < 20

    # teens
    if ten == 10
      words.push(TEENS[value % 100])
    # last digits except zero
    elsif value % 10 != 0
      words.push(ONE_DIGIT[value % 10])
    end
    # extension (thosand, billion, million)
    words.push(EXTENSIONS[extension]) unless extension == 1
    words
  end
end
