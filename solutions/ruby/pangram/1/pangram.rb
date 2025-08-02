module Pangram
  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).uniq().sort() == ("a".."z").to_a
  end
end
