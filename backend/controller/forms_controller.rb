get '/exercises/:form_id/results' do
  @form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless @form_id.match?(/\A\d+\z/)

  @form = Form.find(@form_id)
  halt 404, 'Exercice introuvable.' unless @form

  @fields = Field.all_for_form(@form_id).to_a
  answers_by_date = Answer.all_for_form(@form_id).group_by { |answer| answer['answer_datetime'] }
  @result_rows = []
  answers_by_date.each do |date, answers|
    answers_by_field = answers.group_by { |answer| answer['field_id'] }
    # Conserver toutes les réponses si une question a plusieurs réponses à la même date.
    answers_by_field.values.map(&:length).max.times do |index|
      @result_rows << { date: date, answers: answers_by_field.transform_values { |values| values[index] } }
    end
  end

  erb :'results.html'
end

get '/exercises/:form_id/results.html' do
  redirect "/exercises/#{params[:form_id]}/results", 301
end


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


post '/exercises/:form_id/delete' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Form.delete(form_id)

  redirect '/exercises'
end


post '/exercises/:form_id/closed' do
  form_id = params[:form_id]
  halt 404, 'Exercice introuvable.' unless form_id.match?(/\A\d+\z/)

  form_exists = Form.exists?(form_id)
  halt 404, 'Exercice introuvable.' unless form_exists

  Form.update_status(form_id, 'Closed')

  redirect '/exercises'
end
