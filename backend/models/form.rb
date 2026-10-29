class Form
  attr_reader :id, :name, :status, :fields_count

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
    @status = attributes['status']
    @fields_count = attributes['fields_count'].to_i
  end

  def self.all
    rows = DB.prepare('SELECT forms.id, forms.name, forms.status, (SELECT COUNT(*) FROM fields WHERE fields.form_id = forms.id) AS fields_count FROM forms ORDER BY forms.id').execute
    rows.map { |row| Form.new(row) }
  end

  def self.find(form_id)
    row = DB.prepare('SELECT forms.id, forms.name, forms.status, (SELECT COUNT(*) FROM fields WHERE fields.form_id = forms.id) AS fields_count FROM forms WHERE forms.id = ?').execute(form_id).first
    row ? Form.new(row) : nil
  end

  def self.create(name, status = 'Building')
    name = name.to_s.strip
    raise ValidationError, 'Veuillez saisir un titre.' if name.empty?
    raise ValidationError, 'Le titre ne doit pas dépasser 30 caractères.' if name.length > 30
    raise ValidationError, 'Statut invalide.' unless %w[Building Answering Closed].include?(status)

    DB.prepare('INSERT INTO forms (name, status) VALUES (?, ?)').execute(name, status)
    Form.new('id' => DB.last_id, 'name' => name, 'status' => status, 'fields_count' => 0)
  end

  def fields
    Field.all_for_form(@id)
  end

  def result_rows
    Answer.result_rows_for_form(@id)
  end

  def building?
    @status == 'Building'
  end

  def answering?
    @status == 'Answering'
  end

  def update_status(status)
    raise ValidationError, 'Statut invalide.' unless %w[Building Answering Closed].include?(status)

    DB.prepare('UPDATE forms SET status = ? WHERE id = ?').execute(status, @id)
    @status = status
  end

  def delete
    DB.prepare('DELETE FROM forms WHERE id = ?').execute(@id)
  end
end
