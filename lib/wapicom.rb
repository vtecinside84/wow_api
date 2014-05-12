module Wapi

	class WapiCom
		attr_accessor :hostname,:uri

		def initialize

			@hostname = "http://us.battle.net"
			@uri = "/api/wow"

		end

		def query api

			begin
				format(RestClient.get "#{hostname}#{uri}#{api}")
			rescue => error
				format error.response
			end

		end

		def auctionquery api

			begin
				format(RestClient.get "#{api}")
			rescue => error
				format error.response
			end

		end

		def format input
			MultiJson.load(input)
		end

		def guildsave data

			File.open "/Users/chris/Ruby/wow_api/guild.txt", 'w' do |f|
				f.write(data)
			end

		end

		def auctionsave data

			File.open "/Users/chris/Ruby/wow_api/auction.txt", 'w' do |f|
				f.write(data)
			end

		end

	end

end
