require 'yaml'

class Checker

  def initialize(language)
    @language = language
    @file_hash_data = YAML.load_file("translations_#{@language}.yml") 
    gap_checker_signup
    gap_checker_hompage
    gap_checker_robots
    gap_checker_purchase     
  end
  
  def gap_checker_signup
    @file_email_entry = @file_hash_data["en"]["signup"]["error"]["password_too_short"]
    @file_password_entry = @file_hash_data["en"]["signup"]["error"]["email_required"]
  end
  
  def gap_checker_hompage
    @file_header_entry = @file_hash_data["en"]["homepage"]["header"]
    @file_tagline_entry = @file_hash_data["en"]["homepage"]["header"]
  end

  def gap_checker_robots
    @file_gort_entry = @file_hash_data["en"]["robots"]["gort"]
    @file_hadaly_entry = @file_hash_data["en"]["robots"]["hadaly"]
    @file_gir_entry = @file_hash_data["en"]["robots"]["gir"]
  end

  def gap_checker_purchase
    @file_error_declined_entry = @file_hash_data["en"]["purchase"]["error"]["card_declined"]
    @file_error_invalid_entry = @file_hash_data["en"]["purchase"]["error"]["card_invalid"]
    @file_error_address_entry = @file_hash_data["en"]["purchase"]["error"]["address_required"]
    @file_success_entry = @file_hash_data["en"]["purchase"]["success"]
  end

  def print
    if @file_email_entry == nil
      puts "Need translation for password entry"
    end
    if @file_password_entry == nil
      puts "Need translation for email entry"
    end
    if @file_header_entry == nil
      puts "Need translation for header, in homepage"
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
  end

end


class PrintResults < Checker
  
  language_indicators = {"Welsh" => "cy", "German" => "de", "English" => "en", "French" => "fr", "Italian" => "it"}

  language_indicators.each do |language_name, language_shorthand |
    language = Checker.new(language_shorthand)
    puts language_name
    puts language.print
  end

end




