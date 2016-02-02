# This file was auto-generated by lib/slack/web/api/tasks/generate.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Channels
          #
          # This method archives a channel.
          #
          # @option options [channel] :channel
          #   Channel to archive.
          # @see https://api.slack.com/methods/channels.archive
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.archive.json
          def channels_archive(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.archive', options)
          end

          #
          # This method is used to create a channel.
          #
          # @option options [Object] :name
          #   Name of channel to create.
          # @see https://api.slack.com/methods/channels.create
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.create.json
          def channels_create(options = {})
            throw ArgumentError.new('Required arguments :name missing') if options[:name].nil?
            post('channels.create', options)
          end

          #
          # This method returns a portion of messages/events from the specified channel.
          # To read the entire history for a channel, call the method with no latest or
          # oldest arguments, and then continue paging using the instructions below.
          #
          # @option options [channel] :channel
          #   Channel to fetch history for.
          # @option options [timestamp] :latest
          #   End of time range of messages to include in results.
          # @option options [timestamp] :oldest
          #   Start of time range of messages to include in results.
          # @option options [Object] :inclusive
          #   Include messages with latest or oldest timestamp in results.
          # @option options [Object] :unreads
          #   Include unread_count_display in the output?.
          # @see https://api.slack.com/methods/channels.history
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.history.json
          def channels_history(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.history', options)
          end

          #
          # This method returns information about a team channel.
          #
          # @option options [channel] :channel
          #   Channel to get info on.
          # @see https://api.slack.com/methods/channels.info
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.info.json
          def channels_info(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.info', options)
          end

          #
          # This method is used to invite a user to a channel. The calling user must be a member of the channel.
          #
          # @option options [channel] :channel
          #   Channel to invite user to.
          # @option options [user] :user
          #   User to invite to channel.
          # @see https://api.slack.com/methods/channels.invite
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.invite.json
          def channels_invite(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :user missing') if options[:user].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            options = options.merge(user: users_id(options)['user']['id']) if options[:user]
            post('channels.invite', options)
          end

          #
          # This method is used to join a channel. If the channel does not exist, it is
          # created.
          #
          # @option options [Object] :name
          #   Name of channel to join.
          # @see https://api.slack.com/methods/channels.join
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.join.json
          def channels_join(options = {})
            throw ArgumentError.new('Required arguments :name missing') if options[:name].nil?
            post('channels.join', options)
          end

          #
          # This method allows a user to remove another member from a team channel.
          #
          # @option options [channel] :channel
          #   Channel to remove user from.
          # @option options [user] :user
          #   User to remove from channel.
          # @see https://api.slack.com/methods/channels.kick
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.kick.json
          def channels_kick(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :user missing') if options[:user].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            options = options.merge(user: users_id(options)['user']['id']) if options[:user]
            post('channels.kick', options)
          end

          #
          # This method is used to leave a channel.
          #
          # @option options [channel] :channel
          #   Channel to leave.
          # @see https://api.slack.com/methods/channels.leave
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.leave.json
          def channels_leave(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.leave', options)
          end

          #
          # This method returns a list of all channels in the team. This includes channels the caller is in, channels they are not currently in, and archived channels but does not include private channels. The number of (non-deactivated) members in each channel is also returned.
          #
          # @option options [Object] :exclude_archived
          #   Don't return archived channels.
          # @see https://api.slack.com/methods/channels.list
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.list.json
          def channels_list(options = {})
            post('channels.list', options)
          end

          #
          # This method moves the read cursor in a channel.
          #
          # @option options [channel] :channel
          #   Channel to set reading cursor in.
          # @option options [timestamp] :ts
          #   Timestamp of the most recently seen message.
          # @see https://api.slack.com/methods/channels.mark
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.mark.json
          def channels_mark(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.mark', options)
          end

          #
          # This method renames a team channel.
          #
          # @option options [channel] :channel
          #   Channel to rename.
          # @option options [Object] :name
          #   New name for channel.
          # @see https://api.slack.com/methods/channels.rename
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.rename.json
          def channels_rename(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :name missing') if options[:name].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.rename', options)
          end

          #
          # This method is used to change the purpose of a channel. The calling user must be a member of the channel.
          #
          # @option options [channel] :channel
          #   Channel to set the purpose of.
          # @option options [Object] :purpose
          #   The new purpose.
          # @see https://api.slack.com/methods/channels.setPurpose
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.setPurpose.json
          def channels_setPurpose(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :purpose missing') if options[:purpose].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.setPurpose', options)
          end

          #
          # This method is used to change the topic of a channel. The calling user must be a member of the channel.
          #
          # @option options [channel] :channel
          #   Channel to set the topic of.
          # @option options [Object] :topic
          #   The new topic.
          # @see https://api.slack.com/methods/channels.setTopic
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.setTopic.json
          def channels_setTopic(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :topic missing') if options[:topic].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.setTopic', options)
          end

          #
          # This method unarchives a channel. The calling user is added to the channel.
          #
          # @option options [channel] :channel
          #   Channel to unarchive.
          # @see https://api.slack.com/methods/channels.unarchive
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/channels.unarchive.json
          def channels_unarchive(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('channels.unarchive', options)
          end
        end
      end
    end
  end
end
