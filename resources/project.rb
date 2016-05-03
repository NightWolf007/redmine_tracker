require './resources/base.rb'

module Resource
  class Project < Base
    ATTRS = [
      :id,
      :name,
      :identifier,
      :description,
      :status,
      :created_on,
      :updated_on,
      :parent
    ].freeze

    def serialize
      project = super
      if project[:parent].present?
        project[:parent] = project[:parent].as_json.symbolize_keys
      end
      project
    end
  end
end
