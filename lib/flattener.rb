class Flattener

  def initialize(input)
    @input = input
  end

  def perform
    @elements = []

    @input.delete('[]').split(',') do |elem|
      @elements << begin
        Integer(elem, 10)
      rescue ArgumentError, TypeError
        elem.strip
      end
    end
    @elements
  end

  def to_s
    perform
    @elements.to_s.gsub '"', ''
  end
end
