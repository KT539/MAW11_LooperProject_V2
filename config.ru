require 'bundler/setup'
require 'dotenv/load'
require 'sinatra'
require 'mysql2'
require 'fileutils'

# config
require_relative 'backend/config/constants'
require_relative 'backend/config/database'
require_relative 'backend/config/settings'

# helpers
require_relative 'backend/helpers/path_helpers'
require_relative 'backend/helpers/view_helpers'

# models
require_relative 'backend/models/form'
require_relative 'backend/models/field'

# services
require_relative 'backend/services/fields_page_generator'
require_relative 'backend/services/form_directory_cleaner'

# controllers
require_relative 'backend/controller/forms_controller'
require_relative 'backend/controller/fields_controller'

run Sinatra::Application