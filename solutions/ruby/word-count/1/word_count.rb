class Phrase
  attr_reader :word_count
  
  def initialize(phrase)
    @word_count = phrase.scan(%r{\b[\w']+\b}).reduce({}) do |hash, word| 
      key = word.downcase
      hash[key] = (hash[key] || 0) + 1
      hash
    end
  end
end