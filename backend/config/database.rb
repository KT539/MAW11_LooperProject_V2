DB = Mysql2::Client.new(
  host: ENV.fetch('DB_HOST'),
  username: ENV.fetch('DB_USERNAME'),
  password: ENV.fetch('DB_PASSWORD'),
  database: ENV.fetch('DB_DATABASE')
)


