require 'qml'
require './resources/user'

class UsersController
  include QML::Access

  register_to_qml under: 'UsersController', version: '1.0'

  property(:current) { QML::ArrayModel.new(*Resource::User::ATTRS) }

  def load_current_user
    current << Resource::User.current.serialize
  end
end
