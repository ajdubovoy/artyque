require_relative './controller_macros'
require_relative './view_macros'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.extend ViewMacros, type: :view
end
