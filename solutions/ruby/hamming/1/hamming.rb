module Hamming
  def self.compute(strand_1, strand_2)
    raise ArgumentError if strand_1.size != strand_2.size
    distance = 0
    strand_1.chars.each_with_index do |c, i|
      distance += 1 if c != strand_2[i]
    end
    distance
  end
end