class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split("]:")[1].strip
  end

  def log_level
    idx = @line.index("]")
    @line.slice(1, idx - 1).downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
