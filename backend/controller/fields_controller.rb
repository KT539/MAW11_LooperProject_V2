post '/exercises/:form_id/fields' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)

  label = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s
  halt 422, 'Veuillez saisir un libellé.' if label.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Field.create(label, value_kind, form_id)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end


get '/exercises/:form_id/fields/:field_id/edit' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\d/)

  field = Field.find(field_id, form_id)
  halt 404, 'Champ introuvable.' unless field

  File.read(EDIT_TEMPLATE_PATH)
      .sub('<!-- FORM_ID -->', form_id.to_s)
      .sub('<!-- EDIT_FORM_ACTION -->', "/exercises/#{form_id}/fields/#{field_id}/update")
      .sub('<!-- LABEL_VALUE -->', Rack::Utils.escape_html(field['label']))
      .sub('<!-- VALUE_KIND_OPTIONS -->', value_kind_options(field['type']))
end


post '/exercises/:form_id/fields/:field_id/update' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\d/)

  label = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s.strip
  halt 422, 'Veuillez saisir un label.' if label.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  field_exists = Field.exists?(field_id, form_id)
  halt 404, 'Champ introuvable.' unless field_exists

  Field.update(field_id, form_id, label, value_kind)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end


post '/exercises/:form_id/fields/:field_id/delete' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\d/)

  field_exists = Field.exists?(field_id, form_id)
  halt 404, 'Champ introuvable.' unless field_exists

  Field.delete(field_id, form_id)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end
