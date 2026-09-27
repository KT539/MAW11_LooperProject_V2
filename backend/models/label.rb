def self.all_for_form(form_id)
  DB.prepare('SELECT id, label_name, type FROM labels WHERE form_id = ? ORDER BY id').execute(form_id)
end

def self.find(label_id, form_id)
  DB.prepare('SELECT label_name, type FROM labels WHERE id = ? AND form_id = ?')
    .execute(label_id, form_id).first
end

def self.exists?(label_id, form_id)
  DB.prepare('SELECT id FROM labels WHERE id = ? AND form_id = ?').execute(label_id, form_id).first
end

def self.create(label_name, type, form_id)
  DB.prepare('INSERT INTO labels (label_name, type, form_id) VALUES (?, ?, ?)').execute(label_name, type, form_id)
end

def self.update(label_id, form_id, label_name, type)
  DB.prepare('UPDATE labels SET label_name = ?, type = ? WHERE id = ? AND form_id = ?').execute(label_name, type, label_id, form_id)
end

def self.delete(label_id, form_id)
  DB.prepare('DELETE FROM labels WHERE id = ? AND form_id = ?').execute(label_id, form_id)
end
