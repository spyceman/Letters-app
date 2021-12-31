require 'rails_helper'

RSpec.describe 'Letters', type: :request do
  describe 'POST letters#create' do
    let(:attributes) do
      {
        name: 'Name',
        phone: '1234567891011123',
        title: 'Lorem ipsum dolor sit amet, consectetuer adipiscin',
        description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m',
        email: 'example@gmail.com',
      }
    end

    let(:missing_name) { attributes.except(:name) }
    let(:missing_phone) { attributes.except(:phone) }
    let(:missing_title) { attributes.except(:title) }
    let(:missing_description) { attributes.except(:description) }
    let(:missing_email) { attributes.except(:email) }
    let(:invalid_phone) { attributes.merge(phone: '123') }
    let(:invalid_title) { attributes.merge(title: 'text') }
    let(:invalid_description) { attributes.merge(description: 'text') }
    let(:invalid_email) { attributes.merge(email: 'example') }

    it 'creates letter with valid attributes' do
      letter = Letter.new(attributes)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid without a name' do
      letter = Letter.new(missing_name)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid without a phone' do
      letter = Letter.new(missing_phone)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid without a title' do
      letter = Letter.new(missing_title)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid without a description' do
      letter = Letter.new(missing_description)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid without an email' do
      letter = Letter.new(missing_email)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid with phone shorter than 5 symbols' do
      letter = Letter.new(invalid_phone)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid with title shorter than 50 symbols' do
      letter = Letter.new(invalid_title)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid with description shorter than 100 symbols' do
      letter = Letter.new(invalid_description)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end

    it 'is invalid with incorrect email' do
      letter = Letter.new(invalid_email)
      post '/letters', params: letter
      json = JSON.parse(response.body)
      expect(json).to eq(letter)
    end
  end
end
