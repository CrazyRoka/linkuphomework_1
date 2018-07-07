class Fixnum
  def in_words
    one_digit = {1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eight", 9 => "nine"}
    teens = {10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen", 19 => "nineteen"}
    tens = {20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"}
    prefixes = {1_000_000_000_000 => "trillion", 1_000_000_000 => "billion", 1_000_000 => "million", 1_000 => "thousand", 1 => ""}

    number = self
    answer = []

    prefixes.keys.each do |prefix|
      value = number / prefix % 1_000
      next if value.zero?

      hundred = value / 100
      ten = value % 100 / 10 * 10

      answer.push(one_digit[hundred], "hundred") unless hundred.zero?
      answer.push(tens[ten]) unless ten < 20

      if value % 100 > 9 && value % 100 < 20
        answer.push(teens[value % 100])
      elsif value % 10 != 0
        answer.push(one_digit[value % 10])
      end

      answer.push(prefixes[prefix]) unless prefix == 1
    end

    answer = ["zero"] if answer.empty?
    answer.join(" ")
  end
end