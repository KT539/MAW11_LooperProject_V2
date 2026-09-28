PUBLIC_FOLDER = File.expand_path('../../src/pages', __dir__)
FIELDS_TEMPLATE_PATH = File.join(PUBLIC_FOLDER, 'exercises', 'template', 'fields.html')
EXERCISES_FOLDER = File.join(PUBLIC_FOLDER, 'exercises')
FIELD_TYPES = %w[single_line single_line_list multi_line].freeze
FIELD_TYPE_LABELS = {
  'single_line' => 'Single line text',
  'single_line_list' => 'List of single lines',
  'multi_line' => 'Multi-line text'
}.freeze
EDIT_TEMPLATE_PATH = File.join(PUBLIC_FOLDER, 'exercises', 'template', 'edit.html')


