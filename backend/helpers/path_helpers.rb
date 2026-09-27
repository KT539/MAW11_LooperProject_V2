def fields_page_path(form_id)
  File.join(EXERCISES_FOLDER, form_id.to_s, 'fields.html')
end


def form_directory_path(form_id)
  File.join(EXERCISES_FOLDER, form_id.to_s)
end
