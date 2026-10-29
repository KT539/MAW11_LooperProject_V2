class FieldsController < Parent_Controller
  get '/exercises/:form_id/fields' do
    @form = find_form!
    halt 404, 'Exercice introuvable.' unless @form.building?

    @form_id = @form.id
    @fields = @form.fields
    erb :'fields.html'
  end

  get '/exercises/:form_id/fields.html' do
    redirect "/exercises/#{params[:form_id]}/fields", 301
  end

  post '/exercises/:form_id/fields' do
    form = find_form!
    label = params.dig('field', 'label')
    value_kind = params.dig('field', 'value_kind')
    Field.create(label, value_kind, form.id)

    redirect "/exercises/#{form.id}/fields"
  end

  get '/exercises/:form_id/fields/:field_id/edit' do
    @form = find_form!
    @field = find_field!(@form)
    @form_id = @form.id
    @field_id = @field.id
    erb :'edit.html'
  end

  post '/exercises/:form_id/fields/:field_id/update' do
    form = find_form!
    field = find_field!(form)
    label = params.dig('field', 'label')
    value_kind = params.dig('field', 'value_kind')
    field.update(label, value_kind)

    redirect "/exercises/#{form.id}/fields"
  end

  post '/exercises/:form_id/fields/:field_id/delete' do
    form = find_form!
    field = find_field!(form)
    field.delete

    redirect "/exercises/#{form.id}/fields"
  end
end
