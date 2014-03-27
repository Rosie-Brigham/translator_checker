require 'yaml'

class Checker
  attr_accessor :language, :file_hash_data

  def initialize(language)
    @language = language
  end

  def run
    @file_hash_data = YAML.load_file(file_path) 
    # gap_checker_signup
    # gap_checker_hompage
    # gap_checker_robots
    # gap_checker_purchase     
    gap_checker
  end
  
  def file_path
    @file_path
  end

  def file_path=(path)
    @file_path = path
  end


  # get these so they are not specific (future proof)
  # def gap_checker_signup
  #   @file_email_entry = @file_hash_data["en"]["signup"]["error"]["password_too_short"]
  #   @file_password_entry = @file_hash_data["en"]["signup"]["error"]["email_required"]
  # end
  
  # def gap_checker_hompage
  #   @file_header_entry = @file_hash_data["en"]["homepage"]["header"]
  #   @file_tagline_entry = @file_hash_data["en"]["homepage"]["header"]
  # end

  # def gap_checker_robots
  #   @file_gort_entry = @file_hash_data["en"]["robots"]["gort"]
  #   @file_hadaly_entry = @file_hash_data["en"]["robots"]["hadaly"]
  #   @file_gir_entry = @file_hash_data["en"]["robots"]["gir"]
  # end

  # def gap_checker_purchase
  #   @file_error_declined_entry = @file_hash_data["en"]["purchase"]["error"]["card_declined"]
  #   @file_error_invalid_entry = @file_hash_data["en"]["purchase"]["error"]["card_invalid"]
  #   @file_error_address_entry = @file_hash_data["en"]["purchase"]["error"]["address_required"]
  #   @file_success_entry = @file_hash_data["en"]["purchase"]["success"]
  # end

  def gap_checker
    @missing_values = []
    check_for_nil_values(@file_hash_data)
    #@file_hash_data
    # missing_values = ["Password to short"]
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
    @missing_values.each do |empty|
     puts "Need translation for #{empty} entry"
    end
  end

# work on getting all the puts out of here
  def print
    message =[]
    if @file_email_entry == nil
      message << "Need translation for password entry"
    end
    if @file_password_entry == nil
      message << "Need translation for email entry" 
    end
    if @file_header_entry == nil
      message << "Need translation for header, in homepage"
    end
    if @file_tagline_entry == nil
      puts "Need translation for tagline, in homepage"
    end
    if @file_gort_entry == nil
      puts "Need translation for gort, in robots"
    end
    if @file_hadaly_entry == nil
      puts "Need translation for hadaly, in robots"
    end
    if @file_gir_entry == nil
      puts "Need translation for gir, in robots"
    end
    if @file_error_declined_entry == nil
      puts "Need translation for card declined, in purchase error"
    end
    if @file_error_invalid_entry == nil
      puts "Need translation for invalid entry, in purchase error"
    end
    if @file_error_address_entry == nil
      puts "Need translation for billing addres required, in purchase error"
    end
    if @file_success_entry == nil
      puts "Need translation for purchase comfirmation and thank you message, in purchase success"
    end
    message
  end

end
# get this in a seperate file
class PrintResults < Checker
  
  language_indicators = {"Welsh" => "cy", "German" => "de", "English" => "en", "French" => "fr", "Italian" => "it"}

  language_indicators.each do |language_name, language_shorthand |
    language = Checker.new(language_shorthand)
    puts language_name
    # puts language.print
  end

end