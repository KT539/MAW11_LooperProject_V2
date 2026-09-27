def generate_fields_page(form_id)
  form = Form.find(form_id)
  return false unless form

  labels = Label.all_for_form(form_id)

  label_rows = labels.map do |label|
    <<~HTML
    <tr>
      <td>#{Rack::Utils.escape_html(label['label_name'])}</td>
      <td>#{Rack::Utils.escape_html(label['type'])}</td>
      <td>
          <a class="icon-button" href="/exercises/#{form_id}/labels/#{label['id']}/edit" title="Update"><i class="fa fa-edit"></i></a>
          <form action="/exercises/#{form_id}/labels/#{label['id']}/delete" method="post" style="display:inline">
              <button type="submit" class="icon-button icon-delete" title="Delete"><i class="fa fa-trash-alt"></i></button>
          </form>
      </td>
    </tr>
  HTML
  end.join

  page_content = File.read(FIELDS_TEMPLATE_PATH)
                     .sub('[Forms title]', Rack::Utils.escape_html(form['name']))
                     .sub('<!-- LABEL_ROWS -->', label_rows)
                     .sub('<!-- FIELD_FORM_ACTION -->', "http://localhost:4567/exercises/#{form_id}/fields")
                     .sub('<!-- COMPLETE_FORM_ACTION -->', "http://localhost:4567/exercises/#{form_id}/complete")

  page_path = fields_page_path(form_id)
  FileUtils.mkdir_p(File.dirname(page_path))
  File.write(page_path, page_content)
  true
end
