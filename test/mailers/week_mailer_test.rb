require 'test_helper'

class WeekMailerTest < ActionMailer::TestCase
  test 'weekMail' do
    email = WeekMailer.week_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'notifications@example.com', email.from
    assert_equal 'sales@sgsoft.io', email.to
    assert_equal 'Weekly letter', email.subject
  end
end