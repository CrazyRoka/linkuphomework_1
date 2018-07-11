def translate(sentence)
  sentence.gsub(/\w+/) do |word|
    capitalized = word.match(/^[A-Z]/)
    word.sub!(
      /
      ^([^aeio]*) # select all consonants at the beginning
      (.*)$       # select rest characters
      /xi, '\2\1ay'
    )
    word.capitalize! if capitalized
    word
  end
end
