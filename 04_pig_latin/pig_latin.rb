def translate(sentence)
  sentence.gsub(/\w+/) do |word|
    capitalized = word.match(/^[A-Z]/)
    word[0].downcase!
    word.sub!(
      /
      ^([^aeio]*) # select all consonants at the beginning
      (.*)$       # select rest characters
      /x, '\2\1ay'
    )
    word.capitalize! if capitalized
    word
  end
end
