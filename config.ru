require 'bundler/setup'
require 'dotenv/load'
require 'sinatra/base'
require 'mysql2'

require_relative 'backend/config/constants'
require_relative 'backend/config/database'

require_relative 'backend/models/validation_error'
require_relative 'backend/models/form'
require_relative 'backend/models/field'
require_relative 'backend/models/answer'

require_relative 'backend/controller/parent_controller'
require_relative 'backend/controller/forms_controller'
require_relative 'backend/controller/fields_controller'
require_relative 'backend/controller/pages_controller'

use Rack::Static, urls: ['/assets'], root: File.expand_path('src', __dir__)
use FormsController
use FieldsController
run PagesController
