class Dictionary
  def initialize(dictionary = {})
    @entries = dictionary
  end

  def add(entry)
    if entry.is_a? Hash
      @entries.merge!(entry)
    else
      @entries[entry] = nil
    end
  end

  def include?(key)
    @entries.include?(key)
  end

  def find(prefix)
    @entries.select { |key, value| key =~ /^#{prefix}/ }
  end

  def keywords
    @entries.keys.sort
  end

  def entries
    @entries
  end

  def printable
    entries.sort.collect { |key, value| "[#{key}] \"#{value}\"" }.join("\n")
  end
end