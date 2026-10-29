class PagesController < Parent_Controller
  get '/' do
    erb :'index.html'
  end

  get '/index.html' do
    redirect '/', 301
  end
end