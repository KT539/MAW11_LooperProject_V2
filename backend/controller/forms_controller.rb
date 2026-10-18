class FormsController < Parent_Controller
  get '/exercises' do
    @forms_by_status = Form.all.group_by { |form| form.status }
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
    @answering_forms = Form.all.select { |form| form.answering? }
    erb :'answering.html'
  end

  get '/exercises/answering.html' do
    redirect '/exercises/answering', 301
  end

  get '/exercises/:form_id/results' do
    @form = find_form!
    @form_id = @form.id
    @fields = @form.fields
    @result_rows = @form.result_rows
    erb :'results.html'
  end

  get '/exercises/:form_id/results.html' do
    redirect "/exercises/#{params[:form_id]}/results", 301
  end

  post '/traitement' do
    title = params.dig('exercise', 'title')
    form = Form.create(title)
    redirect "/exercises/#{form.id}/fields"
  end

  post '/exercises/:form_id/complete' do
    form = find_form!
    form.update_status('Answering')
    redirect '/exercises'
  end

  post '/exercises/:form_id/delete' do
    form = find_form!
    form.delete
    redirect '/exercises'
  end

  post '/exercises/:form_id/closed' do
    form = find_form!
    form.update_status('Closed')
    redirect '/exercises'
  end
end
