class Series
  def initialize(str)
    @input = str.split('')
  end

  def slices(n) 
    raise ArgumentError if n > @input.size 
    @input.each_cons(n).map(&:join)
  end
end