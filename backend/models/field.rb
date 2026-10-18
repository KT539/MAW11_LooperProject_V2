class Field
  attr_reader :id, :label, :type, :form_id

  def initialize(attributes)
    @id = attributes['id']
    @label = attributes['label']
    @type = attributes['type']
    @form_id = attributes['form_id']
  end

  def self.all_for_form(form_id)
    rows = DB.prepare('SELECT id, label, type, form_id FROM fields WHERE form_id = ? ORDER BY id').execute(form_id)
    rows.map { |row| Field.new(row) }
  end

  def self.find(field_id, form_id)
    row = DB.prepare('SELECT id, label, type, form_id FROM fields WHERE id = ? AND form_id = ?').execute(field_id, form_id).first
    row ? Field.new(row) : nil
  end

  def self.validate!(label, type)
    raise ValidationError, 'Veuillez saisir un libellé.' if label.empty?
    raise ValidationError, 'Le libellé ne doit pas dépasser 50 caractères.' if label.length > 50
    raise ValidationError, 'Type de valeur invalide.' unless FIELD_TYPES.include?(type)
  end

  def self.create(label, type, form_id)
    label = label.to_s.strip
    type = type.to_s.strip
    validate!(label, type)

    DB.prepare('INSERT INTO fields (label, type, form_id) VALUES (?, ?, ?)').execute(label, type, form_id)
    Field.new('id' => DB.last_id, 'label' => label, 'type' => type, 'form_id' => form_id)
  end

  def update(label, type)
    label = label.to_s.strip
    type = type.to_s.strip
    Field.validate!(label, type)

    DB.prepare('UPDATE fields SET label = ?, type = ? WHERE id = ? AND form_id = ?').execute(label, type, @id, @form_id)
    @label = label
    @type = type
  end

  def delete
    DB.prepare('DELETE FROM fields WHERE id = ? AND form_id = ?').execute(@id, @form_id)
  end
end
