def translate(sentence)
  sentence.gsub(/\w+/) do |word|
    word.sub!(
      /
      ^([^aeio]*) # select all consonants at the beginning
      (.*)$       # select rest characters
      /xi, '\2\1ay'
    )
    word.capitalize! unless word.scan(/[A-Z]/).empty?
    word
  end
end
