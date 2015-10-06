module KumaBot
  module Commands
    class Translate < SlackRubyBot::Commands::Base
      match(/^kumakun t\s+(?<to>.+?)\s+(?<expression>.+)$/) do |client, data, match|
        begin
          to = match['to']
          expression = match['expression'].strip

          if expression =~ /^(.+) --from (.+)$/
            phase = $1
            from = $2
            send_message client, data.channel, "#{from} => #{to}"
          else
            phase = expression
            detection = EasyTranslate.detect(phase, :confidence => true)
            from = detection[:language]
            confidence = detection[:confidence]
            send_message client, data.channel, "#{from}(#{confidence}) => #{to}"
          end
          send_message client, data.channel, "*" + EasyTranslate.translate(phase, :from => from, :to => to) + "*"
        rescue StandardError => e
          send_message client, data.channel, "I got \"#{e.message}\". Check your expression again?"
        end
      end
    end
  end
end
