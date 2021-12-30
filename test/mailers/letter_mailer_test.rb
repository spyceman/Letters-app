require "test_helper"

class LetterMailerTest < ActionMailer::TestCase
  test "letter" do
    
    email = LetterMailer.letter_email

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ["notifications@example.com"], email.from
    assert_equal ["sales@sgsoft.io"], email.to
    assert_equal "New Application", email.subject
    assert_equal read_fixture("letter").join, email.body.to_s
  end
end
