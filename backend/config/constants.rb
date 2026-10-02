VIEWS_FOLDER = File.expand_path('../views', __dir__)
FIELD_TYPES = %w[single_line single_line_list multi_line].freeze
FIELD_TYPE_LABELS = {
  'single_line' => 'Single line text',
  'single_line_list' => 'List of single lines',
  'multi_line' => 'Multi-line text'
}.freeze
