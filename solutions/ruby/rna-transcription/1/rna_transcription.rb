module Complement
  COMPLEMENTS = {
    "G" => "C",
    "C" => 'G',
    'T' => 'A',
    'A' => 'U'
  }
  
  def self.of_dna(strand)
    return "" if strand == ""
    strand.each_char.map {|c| COMPLEMENTS[c] }.join
  end
end