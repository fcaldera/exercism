
module Isogram
  def self.isogram?(phrase)
    letters = phrase.downcase.scan(%r{\w})
    letters == letters.uniq
  end
end
