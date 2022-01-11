CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'
  config.fog_credentials = {
    provider: 'Google',
    google_project: 'My First Project',
    google_json_key_string: File.read("#{Rails.root}/keyfile.json").to_s
  }
  config.fog_directory = 'file_storage1337'
end
