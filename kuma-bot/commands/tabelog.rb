require 'levenshtein'
require 'nokogiri'

module KumaBot
  module Commands
    class Tabelog < SlackRubyBot::Commands::Base
      index = Hash.new
      IO.readlines("config/tabelog_area_code").each do |line|
        parts = line.split(/\t/)
        index[parts[1].chomp!] = parts[0]
        puts parts[0]
      end

      match(/^kumakun tabelog\s+(?<location>.+?)\s+(?<expression>.+)$/) do |client, data, match|
        location = match['location']
        expression = match['expression'].strip

        if index.has_key? location
          mode = "random"
          limit = 5
          if expression =~ /(.+)\s+--(random|top)(\d+)/
            query = $1
            mode = $2
            limit = $3 if $3 <= 20
          else
            query = expression
          end

          station_code = index[location]

          search_url = "http://tabelog.com/#{station_code}/rstLst/1/?SrtT=rt&sk=#{query}"
          html = `curl #{search_url}`
          if html =~ /全 <span class="text-num fs15"><strong>(\d+)<\/strong><\/span> 件/
            if $1 > 1200
              max_page = 60
            else
              max_page = ($1.to_f / 20).ceil
            end
          end

          restaurant_links = Array.new
          max_page.times do |page|
            search_url = "http://tabelog.com/#{station_code}/rstLst/#{page}/?SrtT=rt&sk=#{query}"
            html = `curl #{search_url}`
            html.scan(/data-rd-url="(.+?)" rel="ranking-num"/).each do |url|
              restaurant_links << url
            end
          end

          case mode
          when "random"
            limit.times do |i|
              index = Random.new.rand(restaurant_links.length)
              url = restaurant_links.delete_at(index)
              info = parse(url)
              send_message client, data.channel, "#{info["name"]}\n  #{info["genre"]}\n  #{info["rate"]}\n  #{info["addr"]}\n  #{info["url"]}"
            end
          when "top"
            limit.times do |i|
              url = restaurant_links.delete_at(0)
              info = parse(url)
              send_message client, data.channel, "#{info["name"]}\n  #{info["genre"]}\n  #{info["rate"]}\n  #{info["addr"]}\n  #{info["url"]}"
            end
          end
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

      def self.parse(restaurant_url)
        html = `curl #{restaurant_url}`
        document = Nokogiri::HTML(html)
        table = document.css("#contents-rstdata table.rst-data").first
        nodes = table.css("tr")
        {
          "name"  => trim(nodes[0].css("strong").inner_text),
          "genre" => trim(nodes[1].css("p").inner_text),
          "rate"  => document.at("meta[property='og:description']")['content'],
          "addr"  => trim(nodes[3].css("p").first.inner_text),
          "url"   => restaurant_url,
        }
      end

      def trim(string)
        string.gsub(%r{(^[\s#{$/}]+|[\s#{$/}]+$)}) { "" }
      end

    end
  end
end
