class PagesController < ParentController
  get '/' do
    erb :'index.html'
  end
end
