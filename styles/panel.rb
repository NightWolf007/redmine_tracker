module Styles
  module Panel
    def self.panel
      {
        width: 200,
        height: 1.0,
        scroll: false
      }
    end

    def self.user_name
      {
        margin_top: 10,
        margin_left: 10
      }
    end

    def self.user_email
      {
        margin_bottom: 10,
        margin_left: 10,
        size: 'x-small'
      }
    end

    def self.button
      {
        width: 1.0,
        height: 50
      }
    end
  end
end
