class Acronym
  def self.abbreviate(str) 
    str.split(%r{\W}).map { |w| (w[0] || "").upcase }.join
  end
end