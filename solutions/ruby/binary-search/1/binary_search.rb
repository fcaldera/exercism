class BinarySearch 
  @items = []

  def initialize(items) 
    @items = items
  end

  def search_for(value)
    low = 0
    high = @items.length - 1

    while low <= high
      mid = (low + high) / 2
      guess = @items[mid]
   
      if value < guess
        high = mid - 1
      elsif value > guess
        low = mid + 1 
      else
        return mid  
      end      
    end 
  end
end