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
end

describe "#run" do
  it "should load the appropriate yml file using the file path method" do
    subject.file_path=("./lib/translations_en.yml")
    subject.run
    subject.file_hash_data.should eq ({"en"=>{"signup"=>{"error"=>{"password_too_short"=>"Your password is too short.", "email_required"=>"You must provide an email."}, "success"=>"Welcome!"}, "homepage"=>{"header"=>"Kitchen Buddies Ltd", "tagline"=>"Building friends in the home since 2009."}, "robots"=>{"gort"=>"Gort is good at baking cakes.", "hadaly"=>"Hadaly can hoover up in no time!", "gir"=>"GIR can blend anything."}, "purchase"=>{"error"=>{"card_declined"=>"Your card was declined.", "card_invalid"=>"You must provide a valid credit card number.", "address_required"=>"You must provide a billing address."}, "success"=>"Thank you for your purchase."}}})
  end
end

describe "#file_path" do
  it "sets the file path" do
    subject.file_path=("./lib/translations_en.yml")
    subject.run
    subject.file_path.should eq "./lib/translations_en.yml"
  end
end

describe "#gap_checker" do
  it "should loop through the hash put the keys with the value nil into an array" do
    subject.file_path=("./spec/fixtures/translations_test.yml")
    subject.run
    subject.gap_checker.should include("password_too_short","email_required","success","header","tagline","gort","hadaly","gir","card_declined","card_invalid","address_required","success")
  end
end

describe "#print_two" do
  it "prints out whats missing in the array" do
    subject.file_path=("./spec/fixtures/translations_test.yml")
    subject.run
    subject.gap_checker
    subject.print_two.should include("Need translation for password_too_short entry")
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

end

end

# use test translation files, and write your 
# original class so the name of the file can be passed in,
#  allowing your tests to use the test files
