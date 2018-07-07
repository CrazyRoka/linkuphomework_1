class Book
  def title
    return @title
  end

  def title=(book_title)
    exceptions = %w[over the and a an in of]
    @title =  book_title.gsub(/(\b\w+\b)/) { |match| exceptions.include?(match) ? match : match.capitalize }
    @title[0] = @title[0].upcase
    @title
  end
end