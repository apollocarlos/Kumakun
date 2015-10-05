$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'kuma-bot'
require 'web'

ENV[SLACK_API_TOKEN] = "xoxb-11676548999-2whPLf36Ze5p5lh6Edc6Jm84"

Thread.new do
  begin
    KumaBot::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run KumaBot::Web


