require './resources/base'

module Resource
  class Issue < Base
    ATTRS= [
      :id,
      :project,
      :tracker,
      :status,
      :priority,
      :author,
      :assigned_to,
      :category,
      :subject,
      :description,
      :start_date,
      :done_ratio,
      :custom_fields,
      :created_on,
      :updated_on
    ].freeze

    def serialize
      issue = super
      issue[:project] = (issue[:project].as_json.symbolize_keys if issue[:project].present?)
      issue[:tracker] = (issue[:tracker].as_json.symbolize_keys if issue[:tracker].present?)
      issue[:status] = (issue[:status].as_json.symbolize_keys if issue[:status].present?)
      issue[:priority] = (issue[:priority].as_json.symbolize_keys if issue[:priority].present?)
      issue[:author] = (issue[:author].as_json.symbolize_keys if issue[:author].present?)
      issue[:assigned_to] = (issue[:assigned_to].as_json.symbolize_keys if issue[:assigned_to].present?)
      issue[:category] = (issue[:category].as_json.symbolize_keys if issue[:category].present?)
      issue[:custom_fields].present? ? issue[:custom_fields].map! { |f| f.as_json.symbolize_keys} : []
      issue
    end
  end
end
