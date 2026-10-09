post '/traitement' do
  title = params.dig('exercise', 'title').to_s.strip
  halt 422, 'Veuillez saisir un titre.' if title.empty?

  form_id = Form.create(title, 'Building')

  redirect "/exercises/#{form_id}/fields"
end


post '/exercises/:form_id/complete' do
  form_id = params[:form_id]

  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Form.update_status(form_id, 'Answering')

  redirect '/exercises'
end