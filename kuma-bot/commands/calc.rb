require 'dentaku'

module KumaBot
  module Commands
    class Calc < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'

      def self.call(client, data, match)
        result = Dentaku::Calculator.new.evaluate(match[:expression]) if match.names.include?('expression')
        result = result.to_s if result
        if result && result.length > 0
          send_message client, data.channel, result
        else
          send_message_with_gif client, data.channel, 'I got nothing...'
        end
      rescue StandardError => e
        send_message client, data.channel, "I got \"#{e.message}\". Check your expression again?"
      end
    end
  end
end
