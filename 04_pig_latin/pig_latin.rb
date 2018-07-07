def translate(sentence)
  sentence.gsub(/\b\w+\b/) do |word|
    capitalized = word.match(/^[A-Z]/)
    word[0] = word[0].downcase
    translated_word = word.sub(/^(.*?)([aeio].*)$/, '\2\1ay')
    translated_word.capitalize! if capitalized
    translated_word
  end
end