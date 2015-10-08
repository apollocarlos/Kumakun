module KumaBot
  module Commands
    class Life < SlackRubyBot::Commands::Base

      match(/^kumakun l\s+(?<query>.+?)\s+(?<location>.+)$/) do |client, data, match|
        query = match['query']
        location = match['location'].strip
        loc = Geokit::Geocoders::GoogleGeocoder.geocode(location)
        client = Foursquare2::Client.new(:client_id => '1DVUDEEQTPWYP5ESKZ2CV00YC4ENWQBF1FYIHW3ZFGWRQJZG', :client_secret => 'ADGBK2WXK0ZVO45YQP345BV2PW0AC4IBJ2V35FGWAGWL34EZ')
        res = client.search_venues(:ll => loc.ll, :query => query)
        send_message client, data.channel, res.inspect
      end
    end
  end
end
