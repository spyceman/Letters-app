class WeekMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def week_email
    @weekly_letters = Letter.where(created_at: ((DateTime.current - 7.days)..DateTime.current))
    @url = 'http://example.com/'
    mail(to: 'sales@sgsoft.io', subject: 'Weekly letter')
    end
end
