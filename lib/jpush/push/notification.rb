module JPush
  module Push
    class Notification

      def set_alert(alert)
        @alert = alert
        self
      end

      def set_not_alert
        @alert = ''
        self
      end

      def set_android(alert: , title: nil, builder_id: nil, channel_id: nil,
        priority: nil, category: nil, style: nil, alert_type: nil, big_text: nil, inbox: nil, big_pic_path: nil, extras: nil,
        large_icon: nil, small_icon_uri: nil, intent: nil, uri_activity: nil, uri_action: nil,  badge_add_num: nil,
                      badge_class: nil, sound: nil, show_begin_time: nil, show_end_time: nil, display_foreground: nil)
        @android = {
          alert: alert,
          title: title,
          builder_id: builder_id,
          channel_id: channel_id,
          priority: priority,
          category: category,
          style: style,
          alert_type: alert_type,
          big_text: big_text,
          inbox: inbox,
          big_pic_path: big_pic_path,
          extras: extras,
          large_icon: large_icon,
          small_icon_uri: small_icon_uri,
          intent: intent,
          uri_activity: uri_activity,
          uri_action: uri_action,
          badge_add_num: badge_add_num,
          badge_class: badge_class,
          sound: sound,
          show_begin_time: show_begin_time,
          show_end_time: show_end_time,
          display_foreground: display_foreground
        }.select { |_, value| !value.nil? }
        self
      end

      def set_ios(alert: , sound: nil, badge: '+1', available: nil, category:nil, extras: nil, contentavailable: nil, mutablecontent: nil, thread: nil, interruption: nil)
        contentavailable = available if contentavailable.nil?
        contentavailable = nil unless contentavailable.is_a? TrueClass
        mutablecontent = nil unless mutablecontent.is_a? TrueClass
        @ios = {
          alert: alert,
          sound: sound,
          badge: badge,
          'content-available': contentavailable,
          'mutable-content': mutablecontent,
          category: category,
          extras: extras,
          'thread-id': thread,
          'interruption-level': interruption
        }.select { |_, value| !value.nil? }
        self
      end

      def to_hash
        @notification = {
          alert: @alert,
          android: @android,
          ios: @ios
        }.select { |_, value| !value.nil? }
        raise Utils::Exceptions::JPushError, 'Notification can not be empty.' if @notification.empty?
        @notification
      end

    end
  end
end
