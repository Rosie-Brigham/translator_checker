require 'spec_helper'
require './lib/translator'

describe Checker do

  describe "#initialize" do

    it "should should store the argument in an instance variable" do
      @new = Checker.new("en")
      @langauge = "en"

      @langauge.should eq "en"
    end

    it "should input the language instance variable(en) into the yml file" do
      @language = "en"
      YAML.load_file("./lib/translations_#{@language}.yml").should eq  YAML.load_file("./lib/translations_en.yml")
    end

    # I want this test to check that the language variable are being saved with yaml files into a hash
  end

  describe "#gap_checker_signup" do
  end

  describe "#gap_checker_homepage" do
  end

  describe "#gap_checker_robots" do
  end

  describe "#gap_checker_purchase" do
  end

  describe "#print" do
  end

end

