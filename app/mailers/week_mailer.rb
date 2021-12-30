class WeekMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def week_email
        @weekly_letters = Letter.find_by_sql("
            SELECT * FROM letters
            Where created_at <= now() - INTERVAL '7 days'
          ")
        @url  = 'http://example.com/'
        mail(to: 'sales@sgsoft.io', subject: 'Weekly letter')
      end
end
