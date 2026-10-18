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

