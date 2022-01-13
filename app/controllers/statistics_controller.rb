class StatisticsController < ApplicationController
  require 'json'

  def show
    start_date = params[:startDate]
    end_date = params[:endDate]
    if params[:countryCode]
      countries_list = JSON.parse(File.read("#{Rails.root}/countries.json"))
      country_code = params[:countryCode].to_s.upcase
      country = countries_list.select { |country| country['code'] == country_code }
      phone_code = country[0]['dial_code']
    end

    if start_date && end_date && phone_code
      @letters = Letter.where(created_at: (start_date..end_date), 'phone': "#{phone_code}%")
    elsif start_date && end_date
      @letters = Letter.where(created_at: (start_date..end_date))
    elsif start_date && phone_code
      @letters = Letter.where(created_at: (start_date..), 'phone': "#{phone_code}%")
    elsif end_date && phone_code
      @letters = Letter.where(created_at: (..end_date), 'phone': "#{phone_code}%")
    elsif start_date
      @letters = Letter.where(created_at: (start_date..))
    elsif end_date
      @letters = Letter.where(created_at: (..end_date))
    elsif phone_code
      @letters = Letter.where('phone': "#{phone_code}%")
    end

    if @letters
      render json: @letters
    else
      render json: 'No records found', status: :no_content
    end
  end

  def index
    @letters = Letter.all
    render json: @letters
  end
end
