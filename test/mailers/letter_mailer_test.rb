require 'test_helper'

class LetterMailerTest < ActionMailer::TestCase
  test 'letter' do
    letter = letters(:one)
    email = LetterMailer.with(letter).letter_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'notifications@example.com', email.from
    assert_equal 'sales@sgsoft.io', email.to
    assert_equal 'New Application', email.subject
  end
end