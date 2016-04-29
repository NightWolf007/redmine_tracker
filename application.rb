require 'green_shoes'
require './router'
require './styles'

class Application < Shoes
  cattr_accessor :application, :panel, :header, :body

  def self.run
    app(title: 'Redmine Tracker', height: 600, width: 800) do

      flow do
        @panel = stack Styles::Panel.panel do
          background rgb(106, 90, 205)

          @current_user = Resource::User.current
          para "#{@current_user.firstname} #{@current_user.lastname}",
               Styles::Panel.user_name
          para "#{@current_user.mail}",
               Styles::Panel.user_email

          button 'Projects', Styles::Panel.button do
            Router.path_for(:projects).index
          end

          button 'Issues', Styles::Panel.button do
            Router.path_for(:issues).index
          end

          button 'Settings', Styles::Panel.button do

          end

          button 'Exit', Styles::Panel.button do

          end
        end

        stack Styles::Container.container do
          @header = flow Styles::Header.header do

          end

          @body = stack Styles::Body.body do; end
        end
      end

      @@application = self
      @@panel = @panel
      @@header = @header
      @@body = @body
      Router.path_for(:projects).index
    end
  end
end
