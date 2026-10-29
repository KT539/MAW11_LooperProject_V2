class Answer
  attr_reader :id, :field_id, :answer_content, :answer_datetime, :status

  def initialize(attributes)
    @id = attributes['id']
    @field_id = attributes['field_id']
    @answer_content = attributes['answer_content']
    @answer_datetime = attributes['answer_datetime']
    @status = attributes['status']
  end

  def self.all_for_form(form_id)
    rows = DB.prepare('SELECT answers.id, answers.field_id, answers.answer_content, answers.answer_datetime, answers.status FROM answers INNER JOIN fields ON fields.id = answers.field_id WHERE fields.form_id = ? ORDER BY answers.answer_datetime IS NULL, answers.answer_datetime, answers.id').execute(form_id)
    rows.map { |row| Answer.new(row) }
  end

  def self.create_for_form(form_id, values)
    raise ValidationError, 'Réponses invalides.' unless values.is_a?(Hash)

    fields = Field.all_for_form(form_id)
    field_ids = fields.map { |field| field.id.to_s }
    raise ValidationError, 'Question invalide pour cet exercice.' unless (values.keys - field_ids).empty?

    responses = fields.map do |field|
      value = values[field.id.to_s]
      raise ValidationError, 'Réponse invalide.' unless value.nil? || value.is_a?(String)

      content = value.to_s
      raise ValidationError, 'Une réponse ne doit pas dépasser 250 caractères.' if content.length > 250

      [field.id, content]
    end

    submitted_at = Time.now
    DB.query('START TRANSACTION')
    begin
      statement = DB.prepare('INSERT INTO answers (answer_content, answer_datetime, field_id) VALUES (?, ?, ?)')
      responses.each do |field_id, content|
        statement.execute(content, submitted_at, field_id)
      end
      DB.query('COMMIT')
    rescue StandardError
      DB.query('ROLLBACK')
      raise
    end
    responses.length
  end

  def self.result_rows_for_form(form_id)
    answers_by_date = all_for_form(form_id).group_by { |answer| answer.answer_datetime }
    result_rows = []

    answers_by_date.each do |date, answers|
      answers_by_field = answers.group_by { |answer| answer.field_id }
      answers_by_field.values.map(&:length).max.times do |index|
        result_rows << {
          date: date,
          answers: answers_by_field.transform_values { |values| values[index] }
        }
      end
    end

    result_rows
  end

  def empty?
    @status == 'empty'
  end

  def long?
    @status == 'answered_long'
  end
end

