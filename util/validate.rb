dir = File.expand_path File.dirname(__FILE__)
require "#{dir}/../common/validator/validator.rb"

validator = AXRValidator::Validator.new
scanner = AXRValidator::FileScanner.new

# Default is :fs
scanner.source = :cached if ARGV.include? "--cached"

json_schema_files = {
  /^pages\/.+\/info\.json$/ => 'json-schema/page-info.json',
  /^hssdoc\/.+\/property-\w+\.json$/ => 'json-schema/hssdoc-property.json',
  /^hssdoc\/@\w+\/info\.json$/ => 'json-schema/hssdoc-object-info.json',
  /^wiki\/.+\/info\.json$/ => 'json-schema/wiki-page-info.json',
  /^packages\/.+\/release-[0-9.]+\.json$/ => 'json-schema/release-info.json'
}

scanner.on(/.*\.(json|md)/) do |file|
  generic = AXRValidator::Validators::Generic.new validator, file
  generic.validate_encoding_utf8
  generic.validate_whitespace
end

scanner.on(/.*\.json/) do |file|
  generic = AXRValidator::Validators::Generic.new validator, file
  generic.validate_indentation "\t"

  json = AXRValidator::Validators::JSON.new validator, file
  json.validate_syntax

  json_schema_files.each do |regex, schema_file|
    if regex.match(file.path)
      json.validate_schema("#{File.dirname(__FILE__)}/#{schema_file}")
    end
  end
end

scanner.on(/.*\.md/) do |file|
  md = AXRValidator::Validators::Markdown.new validator, file
  md.validate_line_length
end

validator.messages.each { |msg| puts "#{msg.to_string}\n\n" }
validator.end
