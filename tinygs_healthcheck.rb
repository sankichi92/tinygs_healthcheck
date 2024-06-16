# frozen_string_literal: true

require 'json'
require 'net/http'

STATION_ID = 'sankichi92@7053692003'

uri = URI("https://api.tinygs.com/v1/station/#{STATION_ID}")
response = Net::HTTP.get_response(uri)
response.value

station = JSON.parse(response.body, symbolize_names: true)
abort('Station is not online') if station[:status] != 1
