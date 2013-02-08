require_relative 'validator_base'

class ValidatorMarkdown < ValidatorBase
  def initialize(file)
    @file = file
    @data = File.read(file)

    validate_whitespace
    validate_line_length
  end

  def validate_line_length
    line_number = 1

    @data.split("\n").each do |line|
      # The line is part of a code block
      if line.start_with? "\t"
        next
      end

      # The line starts with HTML
      if line =~ /^<\w+\s.+>/
        next
      end

      # The line ends with an image or a link
      if line =~ /[!]?\[[^\]]+\]\([^\)]+\)$/
        next
      end

      if line.length > 80
        Error.new(@file, line_number, 'Line longer than 80 characters detected')
      end

      line_number += 1
    end
  end
end
