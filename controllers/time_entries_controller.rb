require 'qml'
require './resources/issue'
require './resources/time_entry'

class TimeEntriesController
  include QML::Access

  register_to_qml under: 'TimeEntriesController', version: '1.0'

  property(:model) { QML::ArrayModel.new(*Resource::TimeEntry::ATTRS) }
  def index
    Thread.new do
      QML.next_tick do
        model.clear
        Resource::TimeEntry.all.each do |time_entry|
          model << time_entry.serialize
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

  def user_index(user_id)
    p user_id
    Thread.new do
      QML.next_tick do
        model.clear
        Resource::TimeEntry.where(user_id: user_id).each do |time_entry|
          model << time_entry.serialize
        end
      end
    end
    model
  end
end
