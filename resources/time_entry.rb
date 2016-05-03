require './resources/base.rb'

module Resource
  class TimeEntry < Base
    ATTRS = [
      :id,
      :project,
      :issue,
      :user,
      :activity,
      :hours,
      :comments,
      :spent_on,
      :created_on,
      :updated_on
    ]

    def serialize
      time_entry = super
      time_entry[:project] = (time_entry[:project].as_json.symbolize_keys if time_entry[:project].present?)
      time_entry[:issue] = (time_entry[:issue].as_json.symbolize_keys if time_entry[:issue].present?)
      time_entry[:user] = (time_entry[:user].as_json.symbolize_keys if time_entry[:user].present?)
      time_entry[:activity] = (time_entry[:activity].as_json.symbolize_keys if time_entry[:activity].present?)
      time_entry
    end
  end
end
