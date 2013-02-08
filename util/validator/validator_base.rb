class ValidatorBase
  def validate_whitespace
    line_number = 1

    @data.split("\n").each do |line|
      if line =~ /\s$/
        Error.new(@file, line_number, 'Trailing whitespace detected')
      end

      line_number += 1
    end

    if !(@data =~ /[^\n]\n\z/)
      Error.new(@file, line_number - 1, 'The file must end with exactly one blank line')
    end
  end
end
