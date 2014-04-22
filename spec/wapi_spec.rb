require "rspec"
require "./spec/spec_helper.rb"

describe "wapi" do
	
  subject { Wapi.new }

	it "should initialize a wapi object" do

    expect( subject ).to be_a_kind_of Wapi
    
  end

end