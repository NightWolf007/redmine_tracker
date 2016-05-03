require 'qml'
require './resources/project'
require './resources/issue'

class ProjectsController
  include QML::Access

  register_to_qml under: 'ProjectsController', version: '1.0'

  property(:model) { QML::ArrayModel.new(*Resource::Project::ATTRS) }
  property(:issues) { QML::ArrayModel.new(*Resource::Issue::ATTRS) }

  def index
    Thread.new do
      QML.next_tick do
        model.clear
        issues.clear
        Resource::Project.all.each do |project|
          model << project.serialize
        end
      end
    end
    model
  end

  def show(id)
    Thread.new do
      QML.next_tick do
        model.clear
        issues.clear
        project = Resource::Project.find(id.to_i)
        model << project.serialize
        Resource::Issue.where(project_id: project.id).each do |issue|
          issues << issue.serialize
        end
        issues
      end
    end
    model
  end
end
