def value_kind_options(selected_kind)
  FIELD_TYPES.map do |kind|
    selected = kind == selected_kind ? ' selected="selected"' : ''
    "<option#{selected} value=\"#{kind}\">#{FIELD_TYPE_LABELS[kind]}</option>"
  end.join
end
