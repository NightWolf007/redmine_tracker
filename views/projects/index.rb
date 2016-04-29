require './helpers/views_helper'
require './router'

module Projects
  def self.index(app, projects)

    app.stack do
      # projects.each do |project|
      #   button project.name, ViewsHelper.button_style do
      #     # Router.path_for(:projects).show(project.id)
      #   end
      # end
      app.para 'nYAN'
    end

  end
end
