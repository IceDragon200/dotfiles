require 'rubygems'
require 'libnotify'

def setup_libnotify
  Libnotify.icon_dirs.concat Dir.glob("/usr/share/icons/gnome/*/scalable")
  Libnotify.icon_dirs.uniq!
end

def notify(data)
  Libnotify.show(data)
end

def num_to_bool(highlight)
  highlight != 0
end

def cb_process_message(data, wbuffer, date, tags, displayed, highlight, prefix, message)
  highlight = num_to_bool(highlight)
  #Weechat.print '', tags
  case tags
  when /irc_invite/
    if highlight
      channel_name = Weechat.buffer_get_string(wbuffer, 'name')
      title = "#{channel_name}: #{prefix}"
      notify(summary: title, body: message, timeout: 10.0, icon_path: 'dialog-question-symbolic')
    end
  when /(irc_privmsg|notify_message|notify_private|notify_highlight)/
    is_private = tags.include?('notify_private')
    if highlight || is_private
      channel_name = Weechat.buffer_get_string(wbuffer, 'name')
      title = "#{channel_name}: #{prefix}"
      notify(summary: title, body: message, timeout: 10.0, icon_path: 'dialog-information-symbolic')
      `((play -q /home/icy/opt/audio/sfx/Ring02.wav 2>&1) > /dev/null) &`
    end
  end
  Weechat::WEECHAT_RC_OK
end

def cb_irc_server_connected(data, signal, signal_data)
  notify(summary: "Server", body: "Connected to server #{signal_data}", timeout: 10.0, icon_path: 'network-server-symbolic')
  Weechat::WEECHAT_RC_OK
end

def cb_irc_server_disconnected(data, signal, signal_data)
  notify(summary: "Server", body: "Disconnected from server #{signal_data}", timeout: 10.0, icon_path: 'network-offline-symbolic')
  Weechat::WEECHAT_RC_OK
end

def weechat_init
  setup_libnotify
  notify(body: "Started!", summary: "Weenotify", timeout: 10.0, icon_path: 'dialog-information-symbolic')

  Weechat.register('weenotify', 'IceDragon', '1.0.0', 'MIT', 'Notifications addon', '', '')
  # Register hooks.
  Weechat.hook_signal('irc_server_connected', 'cb_irc_server_connected', '')
  Weechat.hook_signal('irc_server_disconnected', 'cb_irc_server_disconnected', '')
  Weechat.hook_print('', '', '', 1, 'cb_process_message', '')
end
