require 'levenshtein'
require 'nokogiri'

module KumaBot
  module Commands
    class Tabelog < SlackRubyBot::Commands::Base
      index = Hash.new
      IO.readlines("config/tabelog_area_code").each do |line|
        parts = line.split(/\t/)
        index[parts[1].chomp!] = parts[0]
      end

      match(/^kumakun tabelog\s+(?<location>.+?)\s+(?<expression>.+)$/) do |client, data, match|
        location = match['location']
        expression = match['expression'].strip

        if index.has_key? location
          mode = "top"
          limit = 5
          if expression =~ /(.+)\s+--(random|top)(\d+)/
            query = $1
            mode = $2
            limit = $3.to_i if $3.to_i <= 20
          else
            query = expression
          end

          station_code = index[location]

          search_url = "http://tabelog.com/#{station_code}/rstLst/1/?SrtT=rt&sk=#{query}"
          html = `curl #{search_url}`
          if html =~ /全 <span class="text-num fs15"><strong>(\d+)<\/strong><\/span> 件/
            if $1.to_i > 1200
              max_page = 10
            else
              max_page = ($1.to_f / 20).ceil
            end
          end

          restaurant_links = Array.new
	  send_message client, data.channel, "#{max_page}"
          (1..max_page.to_i).each do |page|
	    send_message client, data.channel, "1"
	    send_message client, data.channel, "#{page}"
            search_url = "http://tabelog.com/#{station_code}/rstLst/#{page}/?SrtT=rt&sk=#{query}"
            html = `curl #{search_url}`
            html.scan(/data-rd-url=".*?(http:\/\/tabelog\.com.+?)" rel="ranking-num"/).each do |url|
              restaurant_links << url[0]
            end
          end

	  send_message client, data.channel, restaurant_links.inspect
        else
          guess = ""
          index.keys.each do |l|
            if Levenshtein.normalized_distance(l, location) <= 0.3 || l.match(location)
              guess += "#{l}\n"
            end
          end
          send_message client, data.channel, "Maybe you mean...\n```#{guess}```"
        end
      end
    end
  end
end
