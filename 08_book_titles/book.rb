class Book
  attr_reader :title

  def title=(book_title)
    exceptions = %w[over the and a an in of]
    @title =  book_title.gsub(/(\w+)/) do |match|
      exceptions.include?(match) ? match : match.capitalize
    end
    @title[0] = @title[0].upcase
    @title
  end
end
