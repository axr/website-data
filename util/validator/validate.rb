require_relative 'error.rb'
require_relative 'validator_json.rb'
require_relative 'validator_markdown.rb'

def scan_directory(scan_path)
  Dir.foreach(scan_path) do |file|
    next if ['.git', '.', '..'].include? file

    path = scan_path + '/' + file

    next if path == './util'

    case File.extname(file)
    when '.md'
      ValidatorMarkdown.new path
    when '.json'
      ValidatorJSON.new path
    end

    if File.directory? path
      scan_directory path
    end
  end
end

scan_directory '.'

Error.output_errors

if Error.errors.size == 0
  puts 'Success! No problems found'
else
  exit 1
end
