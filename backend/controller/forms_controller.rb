get '/' do
  redirect '/index.html'
end


get '/index.html' do
  erb :'index.html'
end


get '/exercises.html' do
  @forms_by_status = Form.all.group_by { |form| form['status'] }
  erb :'exercises.html'
end


get '/exercises/new.html' do
  erb :'new.html'
end


get '/exercises/answering.html' do
  @answering_forms = Form.all.select { |form| form['status'] == 'Answering' }
  erb :'answering.html'
end


post '/traitement' do
  title = params.dig('exercise', 'title').to_s.strip
  halt 422, 'Veuillez saisir un titre.' if title.empty?

  form_id = Form.create(title, 'Building')

  redirect "/exercises/#{form_id}/fields.html"
end


post '/exercises/:form_id/complete' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Form.update_status(form_id, 'Answering')

  redirect '/exercises.html'
end
