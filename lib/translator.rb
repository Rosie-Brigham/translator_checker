require 'yaml'

class Checker
  attr_accessor :language, :file_hash_data

  def initialize(language)
    @language = language
  end

  def run
    @file_hash_data = YAML.load_file(file_path) 
    gap_checker
  end
  
  def file_path
    @file_path || "./lib/translations_#{@language}.yml"
  end

  def file_path=(path)
    @file_path = path
  end

  def gap_checker
    @missing_values = []
    check_for_nil_values(@file_hash_data)
  end

  # if the value of the key is a hash, it recursively calls itself
  # if the value of the key is not a hash, then check the value - if nil then do something
  def check_for_nil_values(file_hash_data)

    file_hash_data.each do |key, value|
      if value.is_a?(Hash)
        check_for_nil_values(value)
      elsif value.nil?
        @missing_values << key
      end
    end
    @missing_values
  end

  def print_two
    @missing_values.map do |empty|
      "Need translation for '#{empty}' entry"
    end
  end
# collect works as well

end