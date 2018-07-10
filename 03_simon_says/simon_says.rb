def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, times = 2)
  ([word] * times).join(" ")
end

def start_of_word(word, number_of_characters)
  word[0...number_of_characters]
end

def first_word(sentence)
  sentence[/\w+/]
end

def titleize(sentence)
  exceptions = %w{over the and}
  titleized_sentence =  sentence.gsub(/(\w+)/) do |match|
    exceptions.include?(match) ? match : match.capitalize
  end
  titleized_sentence[0] = titleized_sentence[0].upcase
  titleized_sentence
end
