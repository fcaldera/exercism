
module Isogram
  def self.isogram?(phrase)
    clean = phrase.tr(' ', '').tr('-', '').downcase
    clean.chars.uniq.join == clean 
  end
end
