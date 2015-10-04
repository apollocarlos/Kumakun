require 'json'

module KumaBot
  module Commands
    class Search < SlackRubyBot::Commands::Base
      match(/^kumakun gohan\s+(?<expression>.+)$/) do |client, data, match|
        expression = match['expression'].strip
        send_message client, data.channel, "help me, gohan kun~~~~~"
        send_message client, data.channel, "gohan google #{expression}"
      end

      match(/^kumakun search\s+(?<category>.+?)\s+(?<expression>.+)$/) do |client, data, match|
        category = match['category']
        expression = match['expression'].strip

        case category
        when "web" then
          handle_google_search(category, expression, client, data)
        when "blog" then
          handle_google_search(category, expression, client, data)
        when "book" then
          handle_google_search(category, expression, client, data)
        when "image" then
          handle_google_search(category, expression, client, data)
        when "news" then
          handle_google_search(category, expression, client, data)
        when "video" then
          handle_google_search(category, expression, client, data)
        when "sticker" then
          expression.gsub!(/\s+/, "+")
          response = `curl 'http://api.giphy.com/v1/stickers/random?api_key=dc6zaTOxFJmzC&tag=#{expression}'`
          result = JSON.parse(response)
          unless result["data"].empty?
            link = result["data"]["url"]
            send_message client, data.channel, "I've got one for you:\n#{link}"
          else
            send_message client, data.channel, "I didn't find such sticker T_T"
          end
        when "gif" then
          send_message_with_gif client, data.channel, "I've got one for you:", expression
        else
          send_message client, data.channel, "I don't know >___<"
        end
      end

      def self.handle_google_search(category, expression, client, data)
        if expression =~ /(.+)\s+--(random|limit)/
          query = $1
        else
          query = expression
        end
        query = { query: expression }
        query[:cx] = ENV['GOOGLE_CSE_ID'] if ENV['GOOGLE_CSE_ID']
        c = category.slice(0,1).capitalize + category.slice(1..-1)
        results = eval("::Google::Search::#{c}.new(#{query})").to_a

        if expression =~ /--limit(\d+)/
          number = $1.to_i
        else
          number = 1
        end
        number.times do |i|
          if expression =~ /random/
            index = Random.new.rand(results.length)
            result = results.delete_at(index)
          else
            result = results.delete_at(0)
          end
          message = result.title + "\n" + result.uri
          send_message client, data.channel, message
        end
      end
    end
  end
end
