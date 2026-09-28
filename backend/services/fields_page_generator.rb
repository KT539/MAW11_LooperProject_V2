def generate_fields_page(form_id)
  form = Form.find(form_id)
  return false unless form

  fields = Field.all_for_form(form_id)

  field_rows = fields.map do |field|
    <<~HTML
    <tr>
      <td>#{Rack::Utils.escape_html(field['label'])}</td>
      <td>#{Rack::Utils.escape_html(field['type'])}</td>
      <td>
          <a class="icon-button" href="/exercises/#{form_id}/fields/#{field['id']}/edit" title="Update"><i class="fa fa-edit"></i></a>
          <form action="/exercises/#{form_id}/fields/#{field['id']}/delete" method="post" style="display:inline">
              <button type="submit" class="icon-button icon-delete" title="Delete"><i class="fa fa-trash-alt"></i></button>
          </form>
      </td>
    </tr>
  HTML
  end.join

  page_content = File.read(FIELDS_TEMPLATE_PATH)
                     .sub('[Forms title]', Rack::Utils.escape_html(form['name']))
                     .sub('<!-- FIELD_ROWS -->', field_rows)
                     .sub('<!-- FIELD_FORM_ACTION -->', "/exercises/#{form_id}/fields")
                     .sub('<!-- COMPLETE_FORM_ACTION -->', "/exercises/#{form_id}/complete")

  page_path = fields_page_path(form_id)
  FileUtils.mkdir_p(File.dirname(page_path))
  File.write(page_path, page_content)
  true
end
