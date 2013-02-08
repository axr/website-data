class Error
  @@errors = []

  def initialize(file, line, message)
    @file = file
    @line = line
    @message = message.to_s

    @@errors.push self
  end

  def to_string()
    string = "Error in " + @file
    string += ":" + @line.to_s unless @line.nil?
    string += " " + @message

    return string
  end

  def self.output_errors()
    @@errors.each { |error| puts error.to_string }
  end

  def self.errors
    @@errors
  end 
end
