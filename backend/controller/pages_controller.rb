get '/' do
  erb :'index.html'
end

get '/index.html' do
  redirect '/', 301
end


get '/exercises' do
  @forms_by_status = Form.all.group_by { |form| form['status'] }
  erb :'exercises.html'
end

get '/exercises.html' do
  redirect '/exercises', 301
end


get '/exercises/new' do
  erb :'new.html'
end

get '/exercises/new.html' do
  redirect '/exercises/new', 301
end


get '/exercises/answering' do
  @answering_forms = Form.all.select { |form| form['status'] == 'Answering' }
  erb :'answering.html'
end

get '/exercises/answering.html' do
  redirect '/exercises/answering', 301
end