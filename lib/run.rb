require './lib/translator'

class PrintResults


  def run_results  
    language_indicators = {"Welsh" => "cy", "German" => "de", "English" => "en", "French" => "fr", "Italian" => "it"}

    language_indicators.each do |language_name, language_shorthand |
     translations = Checker.new(language_shorthand)
     
     puts language_name
     translations.run
     translations.gap_checker
     puts translations.print_two
   end
 end 

end

PrintResults.new.run_results