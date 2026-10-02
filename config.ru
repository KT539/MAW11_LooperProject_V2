require 'bundler/setup'
require 'dotenv/load'
require 'sinatra'
require 'mysql2'

# config
require_relative 'backend/config/constants'
require_relative 'backend/config/database'
require_relative 'backend/config/settings'

# helpers
require_relative 'backend/helpers/view_helpers'

# models
require_relative 'backend/models/form'
require_relative 'backend/models/field'

# controllers
require_relative 'backend/controller/forms_controller'
require_relative 'backend/controller/fields_controller'

use Rack::Static, urls: ['/assets'], root: File.expand_path('src', __dir__)
run Sinatra::Application
