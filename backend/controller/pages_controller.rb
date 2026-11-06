class PagesController < ParentController
  get '/' do
    erb :'index.html'
  end

  get '/index.html' do
    redirect '/', 301
  end

  get '/notfound' do
    erb :'notfound.html'
  end

  get '/notfound.html' do
    redirect '/notfound', 404
  end

end
