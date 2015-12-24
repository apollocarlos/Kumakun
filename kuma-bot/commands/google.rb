require 'json'

module KumaBot
  module Commands
    class Google < SlackRubyBot::Commands::Base
      # account: kirino9.dena@gmail.com
      API = 'AIzaSyBwU2EtpRyHozW6dLMh0Wu2dIE11h9Nk8c'

      match(/^kumakun g\s+(?<category>.+?)\s+(?<expression>.+)$/) do |client, data, match|
        category = match['category']
        expression = match['expression'].strip

        case category
        when "kg" then
          handle_google_knowledge_graph(expression, client, data)
        when "web" then
          handle_google_search(category, expression, client, data)
        when "image" then
          handle_google_search(category, expression, client, data)
        when "news" then
          handle_google_search(category, expression, client, data)
        when "video" then
          handle_google_search(category, expression, client, data)
        else
          send_message client, data.channel, "I don't know >__<"
        end
      end

      def self.handle_google_knowledge_graph(expression, client, data)
        query = expression.gsub(/ /, '+')
        response = `curl 'https://kgsearch.googleapis.com/v1/entities:search?query=#{query}&key=#{API}&limit=1&indent=True'`
        result = JSON.parse(response)
        item = result["itemListElement"][0]

        if item.nil?
          send_message client, data.channel, "I don't know about \"#{expression}\"!"
        else
          name = item["result"]["name"]
          description = item["result"]["description"]
          detail = item["result"]["detailedDescription"]["articleBody"]
          wiki = item["result"]["detailedDescription"]["url"]
          url = item["result"]["url"]
          score = item["resultScore"]

          if url.nil?
            message = "Name: #{name}\nDescription: #{description}\nDetail: #{detail}\nWiki: #{wiki}\nResultQuality: #{score}"
          else
            message = "Name: #{name}\nDescription: #{description}\nDetail: #{detail}\nWiki: #{wiki}\nHomepage: #{url}\nResultQuality: #{score}"
          end
          send_message client, data.channel, message
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
