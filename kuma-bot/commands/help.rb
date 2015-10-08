module KumaBot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      match(/^kumakun help\s*$/) do |client, data, match|
        send_message client, data.channel, "what kumakun can do:
	*Google*```kumakun g {web,image,news,video,blog,book} {query} [--limitN] [--random]```
	*Giphy: Search Animated GIFs on the Web*```kumakun {gif,sticker} {query}  # random fetch```
	*Fx rate*```kumakun fxrate {from} {to} [--date yyyy-MM-dd]```
	*Calculator*```kumakun ={expression}```
	*Translator: Bing Translate*```kumakun t {to} {phase} [--from {from}]\nkumakun t list```
	*Weather: Yahoo! Weather*```kumakun w {location}```
	"
      end
    end
  end
end
