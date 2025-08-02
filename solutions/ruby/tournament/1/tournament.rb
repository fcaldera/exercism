module Tournament
  def self.tally(input)
    records = input.strip.lines.reduce({}) { |records, entry|
      team_1, team_2, result = entry.split(';').map(&:strip)
      
      rt1 = records[team_1] || {matches: 0, won: 0, drawn: 0, lost: 0, points: 0}
      rt2 = records[team_2] || {matches: 0, won: 0, drawn: 0, lost: 0, points: 0}

      rt1 = compute(rt1, result)
      rt2 = compute(rt2, reverse(result))

      records[team_1] = rt1
      records[team_2] = rt2
  
      records
    }.sort_by { |k, v| [-v[:points], k] }

    if records.size == 0
      <<~TALLY
        Team                           | MP |  W |  D |  L |  P
      TALLY
    else
      <<~TALLY
        Team                           | MP |  W |  D |  L |  P
        #{records.map { |k, v| line(k, v) }.join("\n")}
      TALLY
    end
  end

  private

  def self.reverse(result) 
    return result if result == "draw"
    result == "win" ? "loss" : "win"
  end

  def self.compute(record, result)
    record[:matches] += 1

    if result == "win"
      record[:won] += 1 
      record[:points] += 3
    elsif result == "draw"
      record[:drawn] += 1
      record[:points] += 1
    else
      record[:lost] += 1
    end

    record
  end

  def self.line(team, data) 
    "#{team.ljust(30)} | #{pad(data[:matches])} | #{pad(data[:won])} | #{pad(data[:drawn])} | #{pad(data[:lost])} | #{pad(data[:points])}"
  end

  def self.pad(num) 
    num.to_s.rjust(2)
  end

end