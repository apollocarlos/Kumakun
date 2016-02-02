# This file was auto-generated by lib/slack/web/api/tasks/generate.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Chat
          #
          # This method deletes a message from a channel.
          #
          # @option options [timestamp] :ts
          #   Timestamp of the message to be deleted.
          # @option options [channel] :channel
          #   Channel containing the message to be deleted.
          # @see https://api.slack.com/methods/chat.delete
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat.delete.json
          def chat_delete(options = {})
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.delete', options)
          end

          #
          # This method posts a message to a public channel, private group, or IM channel.
          #
          # @option options [channel] :channel
          #   Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name. See below for more details.
          # @option options [Object] :text
          #   Text of the message to send. See below for an explanation of formatting.
          # @option options [Object] :username
          #   Name of bot.
          # @option options [Object] :as_user
          #   Pass true to post the message as the authed user, instead of as a bot.
          # @option options [Object] :parse
          #   Change how messages are treated. See below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @option options [Object] :attachments
          #   Structured message attachments.
          # @option options [Object] :unfurl_links
          #   Pass true to enable unfurling of primarily text-based content.
          # @option options [Object] :unfurl_media
          #   Pass false to disable unfurling of media content.
          # @option options [Object] :icon_url
          #   URL to an image to use as the icon for this message.
          # @option options [Object] :icon_emoji
          #   emoji to use as the icon for this message. Overrides icon_url.
          # @see https://api.slack.com/methods/chat.postMessage
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat.postMessage.json
          def chat_postMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text or :attachments missing') if options[:text].nil? && options[:attachments].nil?
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            post('chat.postMessage', options)
          end

          #
          # This method updates a message in a channel.
          #
          # @option options [timestamp] :ts
          #   Timestamp of the message to be updated.
          # @option options [channel] :channel
          #   Channel containing the message to be updated.
          # @option options [Object] :text
          #   New text for the message, using the default formatting rules.
          # @option options [Object] :attachments
          #   Structured message attachments.
          # @option options [Object] :parse
          #   Change how messages are treated. See below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @see https://api.slack.com/methods/chat.update
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat.update.json
          def chat_update(options = {})
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text missing') if options[:text].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.update', options)
          end
        end
      end
    end
  end
end
