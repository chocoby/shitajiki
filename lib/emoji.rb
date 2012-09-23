module Emoji
  class << self
    DEFAULT_HOST = 'http://shitajiki.herokuapp.com'
    DEFAULT_SIZE = 20
    DEFAULT_CLASS = 'emoji'

    def convert(text, options = {})
      host = options[:host] || DEFAULT_HOST
      size = options[:size] || DEFAULT_SIZE
      class_name = options[:class] || DEFAULT_CLASS


      # TODO: +1 は plus1 に変換しないといけない(致命的!)
      text.gsub(/:([a-z0-9_+-]+):/) do |emoji|
        emoji_code = emoji
        emoji = emoji_code.gsub(':', '')

        %{<img src="#{host}/emojis/#{emoji}.png" } +
          %{width="#{size}" height="#{size}" } +
          %{title="#{emoji_code}" alt="#{emoji_code}" class="#{class_name}" />}
      end
    end
  end
end
