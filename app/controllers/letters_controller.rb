class LettersController < ApplicationController
    before_action :find_letter, except: [:create, :index]

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

    def show
        render json: @letter
    end

    def index
        @letters = Letter.all
        render json: @letters
    end

    def update 
        @letter.update(letter_params)
    end

    def destroy 
        @letter.destroy
    end

    private

    def letter_params
        params.require(:letter).permit(:name, :phone, :title, :description, :files, :email)
    end

    def find_letter
        @letter = Letter.find(params[:id])
    end
end
