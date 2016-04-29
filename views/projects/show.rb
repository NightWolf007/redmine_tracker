require './helpers/views_helper'

module Projects
  def self.show(app, project)

    app.stack do
      app.para "Name: #{project.name}"
      app.para "Description: #{project.description}"
      app.para "Created at: #{project.created_on
                                     .to_datetime
                                     .strftime('%Y:%m:%d %H:%M:%S')}"
    end

  end
end
