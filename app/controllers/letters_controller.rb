class LettersController < ApplicationController

    def create 
        @letter = Letter.new(letter_params)
         respond_to do |format|
           if @letter.save
             MailWorker.perform_later(@letter)
             format.json { render json: @letter, status: :created, location: @letter }
           else
             format.json { render json: @letter.errors, status: :unprocessable_entity }
           end
         end
    end

    private 

    def letter_params
        params.require(:letter).permit(:name, :phone, :title, :description, :files, :email)
    end
end
