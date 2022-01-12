class LetterMailer < ApplicationMailer
  require 'google/cloud/storage'
  require 'fileutils'
  default from: 'notifications@example.com'

  def letter_email
    @letter = params[:letter]
    @path = @letter.files.to_s.split('https://storage.googleapis.com/file_storage1337/')[1].to_s
    storage = Google::Cloud::Storage.new(
      project_id: 'My first project',
      credentials: "#{Rails.root}/keyfile.json"
    )
    bucket = storage.bucket 'file_storage1337'
    file = bucket.file(@path)
    Dir.mkdir "#{Rails.root}/public/uploads/#{@letter.id}/"
    file.download "#{Rails.root}/public/uploads/#{@letter.id}/#{File.basename(@path)}"
    @url = 'http://example.com/'
    attachments[File.basename(@path)] = File.open("#{Rails.root}/public/uploads/#{@letter.id}/#{File.basename(@path)}", 'rb') {|io| io.read}
    mail(to: 'sales@sgsoft.io', subject: 'New Application')
  end
end
