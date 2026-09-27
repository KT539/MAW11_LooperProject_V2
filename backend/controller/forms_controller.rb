get '/' do
  redirect '/index.html'
end


post '/traitement' do
  title = params.dig('exercise', 'title').to_s.strip
  halt 422, 'Veuillez saisir un titre.' if title.empty?

  form_id = Form.create(title, 'Building')
  generate_fields_page(form_id)

  redirect "/exercises/#{form_id}/fields.html"
end


post '/exercises/:form_id/complete' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\d/)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Form.update_status(form_id, 'Answering')
  FileUtils.rm_rf(form_directory_path(form_id))
  cleanup_expired_form_directories

  redirect '/exercises.html'
end


