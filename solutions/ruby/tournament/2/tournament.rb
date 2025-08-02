module Tournament

  def self.tally(input)

    store = Hash.new { |hash, key| 
      hash[key] = {matches: 0, won: 0, drawn: 0, lost: 0, points: 0} 
    }

    input.strip.lines.each { |entry|
      team_1, team_2, result = entry.split(';').map(&:strip)
      store[team_1] = compute(store[team_1], result)
      store[team_2] = compute(store[team_2], reverse(result))
    }

    header = format(%w(Team MP W D L P))
    body = store
      .sort_by { |k, v| [-v[:points], k] }
      .map { |k, v| format(to_array(k, v)) }
      .join

    header + body
  end

  private

  def self.to_array(k, v)
    [k, v[:matches], v[:won], v[:drawn], v[:lost], v[:points]]
  end

  def self.format(record) 
    sprintf "%-30s | %2s | %2s | %2s | %2s | %2s\n", *record
  end

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

end