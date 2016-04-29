require './styles/body'

module Projects
  def self.show(body, project)

    body.app do
      @body.clear do
        para "Name: #{project.name}"
        para "Description: #{project.description}"
        para "Created at: #{project.created_on
                                   .to_datetime
                                   .strftime('%Y:%m:%d %H:%M:%S')}"
      end
    end

  end
end
