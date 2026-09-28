module Form
    def self.find(form_id)
      DB.prepare('SELECT name FROM forms WHERE id = ?').execute(form_id).first
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
end
