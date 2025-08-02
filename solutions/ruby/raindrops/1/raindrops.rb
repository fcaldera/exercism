module Raindrops
  def self.convert(n) 
    result = 
      (n % 3 == 0 ? "Pling" : "") +
      (n % 5 == 0 ? "Plang" : "") +
      (n % 7 == 0 ? "Plong" : "") 

    result.empty? ? n.to_s : result
  end
end
    
    