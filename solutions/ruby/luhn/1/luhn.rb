module Luhn
  def self.valid?(input) 
    return false if not input.match?(/^[\d ]+$/)
    
    digits = input.scan(/\d/)
    return false if digits.length <= 1 
      
    arr = digits.map.with_index do |char, i|
      n = char.to_i
      n = (i + 1) % 2 == 0 ? n * 2 : n
      n > 9 ? n - 9 : n
    end

    arr.sum % 2 == 0
  end
end
