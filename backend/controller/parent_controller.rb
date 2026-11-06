class ParentController < Sinatra::Base
  set :views, VIEWS_FOLDER
  set :static, false
  set :show_exceptions, false

  before do
    path = request.path_info
    next if path.start_with?('/assets/')

    clean_path = path.gsub(%r{\.[^/]*\z}, '')
    next if clean_path == path

    clean_path = '/' if clean_path.empty? || clean_path == '/index'
    clean_path += "?#{request.query_string}" unless request.query_string.empty?

    redirect clean_path, (request.get? || request.head? ? 301 : 308)
  end

  error ValidationError do
    content_type :text
    status 422
    erb :'error422.html'
  end

  def h(value)
    Rack::Utils.escape_html(value.to_s)
  end

  def find_form!
    form_id = params[:form_id].to_s
    halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

    form = Form.find(form_id)
    halt 404, 'Exercice introuvable.' unless form
    form
  end

  def find_field!(form)
    field_id = params[:field_id].to_s
    halt 404, 'Champ introuvable.' unless field_id.match?(/\A\d+\z/)

    field = Field.find(field_id, form.id)
    halt 404, 'Champ introuvable.' unless field
    field
  end

  not_found do
    status 404
    erb :'error404.html'
  end

  error 500 do
    status 500
    erb :'error500.html'
  end
end

