require 'slack-ruby-bot'

module SlackRubyBot
  module Hooks
    module PresenceChange
      extend SlackRubyBot::Hooks::Base

      def presence_change(client, data)
        puts '== PROCESSING COMMAND =='
        logger.info(data)
      end
    end
  end
end

module SlackRubyBot
  class Server
    include SlackRubyBot::Hooks::PresenceChange
  end
end

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    puts '== PROCESSING COMMAND =='
    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run
