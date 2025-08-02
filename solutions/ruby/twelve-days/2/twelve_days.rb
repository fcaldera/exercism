class TwelveDays
  ORDINALITY = %w(first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)
  
  GIFTS = [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]
  
  def self.song
    (0...12).map { |day| 
      gifts_list = gifts_from(day)
      "On the #{ORDINALITY[day]} day of Christmas my true love gave to me: #{gifts_list}.\n"
    }.join("\n")
  end

  def self.gifts_from(day)
    (0..day).to_a.reverse.reduce("") { |text, day|       
      connector = text.empty? ? "" : (day == 0 ? ", and " : ", ")
      text + connector + GIFTS[day]
    }    
  end
end