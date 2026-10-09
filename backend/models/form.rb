module Form
    def self.all
      DB.prepare('SELECT forms.id, forms.name, forms.status, (SELECT COUNT(*) FROM fields WHERE fields.form_id = forms.id) AS fields_count FROM forms ORDER BY forms.id').execute
    end

    def self.find(form_id)
      DB.prepare('SELECT name, status FROM forms WHERE id = ?').execute(form_id).first
    end

    def self.exists?(form_id)
      DB.prepare('SELECT id FROM forms WHERE id = ?').execute(form_id).first
    end

    def self.create(name, status)
      DB.prepare('INSERT INTO forms (name, status) VALUES (?, ?)').execute(name, status)
      DB.last_id
    end

    def self.update_status(form_id, status)
      DB.prepare('UPDATE forms SET status = ? WHERE id = ?').execute(status, form_id)
    end

    def self.delete(form_id)
      DB.prepare('DELETE FROM forms WHERE id = ?').execute(form_id)
    end
end
