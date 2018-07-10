class Dictionary
  attr_reader :entries

  def initialize(dictionary = {})
    @entries = dictionary
  end

  def add(entry)
    entry = { entry => nil } unless entry.is_a? Hash
    @entries.merge!(entry)
  end

  def include?(key)
    @entries.include?(key)
  end

  def find(prefix)
    @entries.select { |key| key =~ /^#{prefix}/ }
  end

  def keywords
    @entries.keys.sort
  end

  def printable
    entries.sort.collect { |key, value| "[#{key}] \"#{value}\"" }.join("\n")
  end
end
