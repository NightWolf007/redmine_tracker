require 'qml'
require './resources/project'
require './resources/issue'
require './resources/time_entry'

class IssuesController
  include QML::Access

  register_to_qml under: 'IssuesController', version: '1.0'

  property(:model) { QML::ArrayModel.new(*Resource::Issue::ATTRS) }
  property(:time_entries) { QML::ArrayModel.new(*Resource::TimeEntry::ATTRS) }

  def index
    Thread.new do
      QML.next_tick do
        model.clear
        time_entries.clear
        Resource::Issue.all.each do |issue|
          model << issue.serialize
        end
      end
    end
    model
  end

  def show(id)
    Thread.new do
      QML.next_tick do
      end
    end
    nil
  end
end
