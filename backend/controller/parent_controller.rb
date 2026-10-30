class ParentController < Sinatra::Base
  set :views, VIEWS_FOLDER
  set :static, false
  set :show_exceptions, false

  error ValidationError do
    content_type :text
    status 422
    env['sinatra.error'].message
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
end
