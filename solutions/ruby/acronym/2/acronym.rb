class Acronym
  def self.abbreviate(str) 
    str.split(/\W/).map(&:chr).join.upcase
  end
end