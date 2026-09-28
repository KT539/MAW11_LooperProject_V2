module Field
    def self.all_for_form(form_id)
      DB.prepare('SELECT id, label, type FROM fields WHERE form_id = ? ORDER BY id').execute(form_id)
    end

    def self.find(field_id, form_id)
      DB.prepare('SELECT label, type FROM fields WHERE id = ? AND form_id = ?')
        .execute(field_id, form_id).first
    end

    def self.exists?(field_id, form_id)
      DB.prepare('SELECT id FROM fields WHERE id = ? AND form_id = ?').execute(field_id, form_id).first
    end

    def self.create(label, type, form_id)
      DB.prepare('INSERT INTO fields (label, type, form_id) VALUES (?, ?, ?)').execute(label, type, form_id)
    end

    def self.update(field_id, form_id, label, type)
      DB.prepare('UPDATE fields SET label = ?, type = ? WHERE id = ? AND form_id = ?').execute(label, type, field_id, form_id)
    end

    def self.delete(field_id, form_id)
      DB.prepare('DELETE FROM fields WHERE id = ? AND form_id = ?').execute(field_id, form_id)
    end
end
