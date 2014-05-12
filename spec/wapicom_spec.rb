require_relative "../lib/wapicom.rb"
require "rspec"
require "./spec/spec_helper.rb"

describe "wapiCom" do
	let(:invalidurl){"/guild/test-realm/test?fields=members"}
	let(:guildurl){"/guild/Baelgun/Home%20Brewed?fields=members"}
	let(:auctionurl){"/auction/data/Baelgun"}
  subject { Wapi::WapiCom.new }

	it "should initialize a wapiCom object" do

    expect( subject ).to be_a_kind_of Wapi::WapiCom

  end

  it "should include the hostname" do

  	expect( subject ).to respond_to :hostname
  	expect( subject.hostname ).to eq "http://us.battle.net"

  end

  it "should include the URI" do

  	expect( subject ).to respond_to :uri
  	expect( subject.uri ).to eq "/api/wow"

  end

  it "should query the WoW API" do

  	output = subject.query guildurl

  	expect( subject ).to respond_to :query
  	expect( output ).to be_a_kind_of Hash
  	expect( output ).to have_key "realm"
  	expect( output["realm"] ).to eq "Baelgun"


  end

	it "should save the guild results in a text file" do

		output = subject.query guildurl
		file = subject.guildsave output

	end

	it "should save the auction results in a text file" do

		output = subject.query auctionurl

		cleanurl = (((output['files'])[0])['url'])

		auctiondata = subject.auctionquery cleanurl

		file = subject.auctionsave auctiondata

	end

  it "should return an error for invalidurl" do

  	output = subject.query invalidurl

  	expect( output ).to have_key "status"
  	expect( output["status"] ).to eq "nok"

  end

end
