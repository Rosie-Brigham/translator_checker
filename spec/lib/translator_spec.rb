require 'spec_helper'
require './lib/translator'

describe Checker do
 subject do
  test_checker = Checker.new("en")
end

describe "#initialize" do
  it "should should store the argument in an instance variable" do
    subject.language.should eq "en"
  end

  it "should input the language instance variable(en) and load the appropriate yml file" do
    subject.file_hash_data.should eq ({"en"=>{"signup"=>{"error"=>{"password_too_short"=>"Your password is too short.", "email_required"=>"You must provide an email."}, "success"=>"Welcome!"}, "homepage"=>{"header"=>"Kitchen Buddies Ltd", "tagline"=>"Building friends in the home since 2009."}, "robots"=>{"gort"=>"Gort is good at baking cakes.", "hadaly"=>"Hadaly can hoover up in no time!", "gir"=>"GIR can blend anything."}, "purchase"=>{"error"=>{"card_declined"=>"Your card was declined.", "card_invalid"=>"You must provide a valid credit card number.", "address_required"=>"You must provide a billing address."}, "success"=>"Thank you for your purchase."}}})
  end

    # here is an alternative to the above which stubs out the YAMl
    # it "returns the correct file" do
    #   parsed_yaml = { "language" => "translation"}
    #   YAML.stub(:load_file).and_return(parsed_yaml)
    #   subject.file_hash_data.should eq ({ "language" => "translation"})

      # this version is shorter and neater, the above however directly tests the code
      # there is an issue here with scope, as this stub is affecting the first test, check whats happening
    # end
  end

  describe "#gap_checker_signup" do
    it "should return true or false, depending on wether the imput has been filled" do
      subject.gap_checker_signup.should be_true
      # This test is using the english file, which has all the imput filled, therefore everything should return true. If the 
      # 'en' argument in the Checker.new is replaced with 'fr' or similar, then these tests will start failing
    end
  end

  describe "#gap_checker_hompage" do
    it "should return true if the imput has been filled" do
      subject.gap_checker_hompage.should be_true
    end
  end

  describe "#gap_checker_robots" do
    it "should return true if the imput has been filled" do
      subject.gap_checker_robots.should be_true
    end
  end

  describe "#gap_checker_purchase" do
    it "should return true if all imput has been filled" do
      subject.gap_checker_purchase.should be_true
    end
  end

  describe "#print" do
    it "puts a messages into an array if there is no password entry" do
      different_langauge = Checker.new("fr")
      different_langauge.print.should include("Need translation for password entry")
    end
    
    it "puts a message into an array if there is no email entry" do
      different_langauge = Checker.new("fr")
      different_langauge.print.should include("Need translation for email entry")
    end
    
    it "puts a message into an array if there is no header entry" do
        subject.file_path=("./spec/fixtures/translations_test.yml")
        subject.file_path should eq "./spec/fixtures/translations_test.yml"
    end
  end

end

# use test translation files, and write your 
# original class so the name of the file can be passed in,
#  allowing your tests to use the test files
