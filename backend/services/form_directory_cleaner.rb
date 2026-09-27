def cleanup_expired_form_directories
  expiration_time = Time.now - 86_400

  Dir.children(EXERCISES_FOLDER).each do |entry|
    next unless entry.match?(/\d/)

    directory = File.join(EXERCISES_FOLDER, entry)
    next unless File.directory?(directory)

    created_at = File.birthtime(directory)
    FileUtils.rm_rf(directory) if created_at < expiration_time
  rescue NotImplementedError
    FileUtils.rm_rf(directory) if File.mtime(directory) < expiration_time
  end
end
