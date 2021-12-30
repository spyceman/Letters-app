class LetterMailer < ApplicationMailer
  default from: 'notifications@example.com'

    def letter_email
      @letter = params[:letter]
      @url  = 'http://example.com/'
      encoded_content = SpecialEncode(File.read(@letter.files))
      attachments['file'] = { mime_type: 'application/gzip',
      encoding: 'SpecialEncoding',
      content: encoded_content
      }
      mail(to: email_address_with_name('sales@sgsoft.io', @letter.name), subject: 'New Application')
    end
end
