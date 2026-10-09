get '/exercises/:form_id/fields' do
  @form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless @form_id.match?(/\A\d+\z/)

  @form = Form.find(@form_id)
  halt 404, 'Exercice introuvable.' unless @form && @form['status'] == 'Building'

  @fields = Field.all_for_form(@form_id)
  erb :'fields.html'
end

get '/exercises/:form_id/fields.html' do
  redirect "/exercises/#{params[:form_id]}/fields", 301
end


post '/exercises/:form_id/fields' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

  label = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s
  halt 422, 'Veuillez saisir un libellé.' if label.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Field.create(label, value_kind, form_id)

  redirect "/exercises/#{form_id}/fields"
end


get '/exercises/:form_id/fields/:field_id/edit' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\A\d+\z/)

  @form_id = form_id
  @field_id = field_id
  @field = Field.find(field_id, form_id)
  halt 404, 'Champ introuvable.' unless @field

  erb :'edit.html'
end


post '/exercises/:form_id/fields/:field_id/update' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\A\d+\z/)

  label = params.dig('field', 'label').to_s.strip
  value_kind = params.dig('field', 'value_kind').to_s.strip
  halt 422, 'Veuillez saisir un label.' if label.empty?
  halt 422, 'Type de valeur invalide.' unless FIELD_TYPES.include?(value_kind)

  field_exists = Field.exists?(field_id, form_id)
  halt 404, 'Champ introuvable.' unless field_exists

  Field.update(field_id, form_id, label, value_kind)

  redirect "/exercises/#{form_id}/fields"
end


post '/exercises/:form_id/fields/:field_id/delete' do
  form_id = params[:form_id]
  field_id = params[:field_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)
  halt 404, 'Champ introuvable.' unless field_id.match?(/\A\d+\z/)

  field_exists = Field.exists?(field_id, form_id)
  halt 404, 'Champ introuvable.' unless field_exists

  Field.delete(field_id, form_id)

  redirect "/exercises/#{form_id}/fields"
end
