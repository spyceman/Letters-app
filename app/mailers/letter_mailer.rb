class LetterMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def letter_email
    @letter = params[:letter]
    @url = 'http://example.com/'
    attachments['robots.txt'] = File.read("#{Rails.root}/public/robots.txt")
    mail(to: 'sales@sgsoft.io', subject: 'New Application')
  end
end
