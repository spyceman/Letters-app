set :environment, "development"

every :friday, at: '8am' do 
    WeekMailer.with(weekly_letters: @weekly_letters).week_email.deliver_now
  end

