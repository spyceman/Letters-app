class LettersController < ApplicationController
  include ActionController::MimeResponds
  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      LetterMailer.with(letter: @letter).letter_email.deliver_now
      render json: 'Successfully created', status: :created
    else
      render json: @letter.errors, status: :unprocessable_entity
    end
  end

    private

  def letter_params
    params.require(:letter).permit(:name, :phone, :title, :description, :files, :email)
  end
  end

