helpers do
  def h(value)
    Rack::Utils.escape_html(value.to_s)
  end
end
