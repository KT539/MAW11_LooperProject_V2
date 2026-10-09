module Answer
    def self.all_for_form(form_id)
      DB.prepare('SELECT answers.id, answers.field_id, answers.answer_content, answers.answer_datetime, answers.status FROM answers INNER JOIN fields ON fields.id = answers.field_id WHERE fields.form_id = ? ORDER BY answers.answer_datetime IS NULL, answers.answer_datetime, answers.id').execute(form_id)
    end
end
