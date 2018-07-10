class XmlDocument
  def initialize(padding = false)
    @padding = padding
    @padding_level = 0
  end

  def method_missing(name, args = {}, &block)
    @padding_level += 2
    answer = if block
               prefix = create_open_tag(name)
               inner = block.call().to_s
               suffix = create_close_tage(name)

               if @padding
                 padding = " " * @padding_level
                 prefix += "\n"
                 suffix += "\n"
                 inner = padding + inner + padding[0...-2]
               end

               prefix + inner + suffix
             else
               create_empty_tag(name, args) + (@padding ? "\n" : "")
             end

    @padding_level -= 2
    answer
  end

  private

  def create_empty_tag(name, args = {})
    create_open_tag(name, args).insert(-2, '/')
  end

  def create_open_tag(name, args = {})
    attributes = args.map { |key, value| " #{key}='#{value}'" }.join
    "<#{name}#{attributes}>"
  end

  def create_close_tage(name)
    "</#{name}>"
  end
end
