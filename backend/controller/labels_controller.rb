post '/exercises/:form_id/fields' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)

  label_name = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s
  halt 422, 'Veuillez saisir un libellé.' if label_name.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Label.create(label_name, value_kind, form_id)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end


get '/exercises/:form_id/labels/:label_id/edit' do
  form_id = params[:form_id]
  label_id = params[:label_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Label introuvable.' unless label_id.match?(/\d/)

  label = Label.find(label_id, form_id)
  halt 404, 'Label introuvable.' unless label

  File.read(EDIT_TEMPLATE_PATH)
      .sub('<!-- FORM_ID -->', form_id.to_s)
      .sub('<!-- EDIT_FORM_ACTION -->', "/exercises/#{form_id}/labels/#{label_id}/update")
      .sub('<!-- LABEL_VALUE -->', Rack::Utils.escape_html(label['label_name']))
      .sub('<!-- VALUE_KIND_OPTIONS -->', value_kind_options(label['type']))
end


post '/exercises/:form_id/labels/:label_id/update' do
  form_id = params[:form_id]
  label_id = params[:label_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Label introuvable.' unless label_id.match?(/\d/)

  label_name = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s.strip
  halt 422, 'Veuillez saisir un label.' if label_name.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  label_exists = Label.exists?(label_id, form_id)
  halt 404, 'Label introuvable.' unless label_exists

  Label.update(label_id, form_id, label_name, value_kind)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end


post '/exercises/:form_id/labels/:label_id/delete' do
  form_id = params[:form_id]
  label_id = params[:label_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)
  halt 404, 'Label introuvable.' unless label_id.match?(/\d/)

  label_exists = Label.exists?(label_id, form_id)
  halt 404, 'Label introuvable.' unless label_exists

  Label.delete(label_id, form_id)
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end
