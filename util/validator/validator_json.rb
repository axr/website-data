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
    validate_file_name
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

  def validate_file_name
    file_name = Pathname.new(@file).basename.to_s

    /^property-(\w+)\.json$/.match(file_name) do |match|
      begin
        data = JSON.parse(@data)

        if data['name'] != match[1]
          Error.new(@file, nil, "The property name defined in the JSON file does not match the file name")
        end
      rescue
      end
    end

    /^\.\/hssdoc\/(@\w+)\/info.json$/.match(@file) do |match|
      begin
        data = JSON.parse(@data)

        if data['name'] != match[1]
          Error.new(@file, nil, "The object name defined in json.info does not match the directory name")
        end
      rescue
      end
    end
  end
end
