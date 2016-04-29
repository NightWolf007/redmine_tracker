require './styles/body'
require './router'

module Projects
  def self.index(body, projects)

    body.app do
      @body.clear do
        projects.each do |project|
          button project.name, Styles::Body.button do
            Router.path_for(:projects).show(project.id)
          end
        end
      end
    end

  end
end
