class PagesController < ParentController
  get '/' do
    erb :'index.html'
  end

  get '/index.html' do
    redirect '/', 301
  end
end
