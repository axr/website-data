require 'json'
require 'json-schema'
require_relative 'validator_base'

class ValidatorJSON < ValidatorBase
  @@schema_files = {
    /^\.\/pages\/.+\/info\.json$/ => 'schema/page-info.json',
    /^\.\/hssdoc\/.+\/property-\w+\.json$/ => 'schema/hssdoc-property.json',
    /^\.\/hssdoc\/@\w+\/info\.json$/ => 'schema/hssdoc-object-info.json',
    /^\.\/wiki\/.+\/info\.json$/ => 'schema/wiki-page-info.json',
    /^\.\/packages\/.+\/release-[0-9.]+\.json$/ => 'schema/release-info.json'
  }

  def initialize(file)
    @file = file
    @data = File.read(file)

    validate_syntax
    validate_whitespace
    validate_schema
  end

  def validate_syntax
    begin
      JSON.parse(@data)
    rescue JSON::ParserError => e
      Error.new(@file, nil, 'Syntax error')
    end
  end

  def validate_schema
    schema_dir = File.dirname(__FILE__)  + '/'
    schema_file = nil

    @@schema_files.each do |regex, file|
     schema_file = schema_dir + file if regex =~ @file
    end

    return if schema_file.nil?

    begin
      JSON::Validator.validate!(schema_file, @data)
    rescue JSON::Schema::ValidationError
      Error.new(@file, nil, $!)
    end
  end
end
