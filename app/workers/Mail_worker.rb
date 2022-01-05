class MailWorker
  include Sidekiq::Worker
  def perform(*args)
    LetterMailer.with(letter: @letter).letter_email.deliver_now
  end
end
