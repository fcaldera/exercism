class Phrase
  attr_reader :word_count
  
  def initialize(phrase)
    @word_count = 
      phrase.downcase.scan(%r{\b[\w']+\b})
      .reduce({}) do |hash, key| 
        hash[key] = (hash[key] || 0) + 1
        hash
      end
  end
end