require 'slack-ruby-bot'

class WeatherBot < SlackRubyBot::Bot
  match(/^How is the weather in (?<location>\w*)\?$/i) do |client, data, match|
    client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  end
end

WeatherBot.run
