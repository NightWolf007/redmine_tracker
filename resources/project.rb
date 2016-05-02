require './resources/base.rb'

module Resource
  class Project < Base
    ATTRS = [ :id,
                :name,
                :identifier,
                :description,
                :status,
                :created_on,
                :updated_on
    ].freeze

    def serialize
      super.tap { |h| h.delete(:parent) }
    end
  end
end
