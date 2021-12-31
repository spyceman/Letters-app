require 'rails_helper'

describe MailWorker do
  let(:attributes) do
    {
      name: 'Name',
      phone: '1234567891011123',
      title: 'Lorem ipsum dolor sit amet, consectetuer adipiscin',
      description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m',
      email: 'example@gmail.com'
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

  it 'is considered valid' do
    expect(Letter.new(attributes)).to be_valid
  end

  it 'is invalid without a name' do
    expect(Letter.new(missing_name)).not_to be_valid
  end

  it 'is invalid without a phone' do
    expect(Letter.new(missing_phone)).not_to be_valid
  end

  it 'is invalid without a title' do
    expect(Letter.new(missing_title)).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(Letter.new(missing_description)).not_to be_valid
  end

  it 'is invalid without an email' do
    expect(Letter.new(missing_email)).not_to be_valid
  end

  it 'is invalid with phone shorter than 5 symbols' do
    expect(Letter.new(invalid_phone)).not_to be_valid
  end

  it 'is invalid with title shorter than 50 symbols' do
    expect(Letter.new(invalid_title)).not_to be_valid
  end

  it 'is invalid with description shorter than 100 symbols' do
    expect(Letter.new(invalid_description)).not_to be_valid
  end

  it 'is invalid with incorrect email' do
    expect(Letter.new(invalid_email)).not_to be_valid
  end
end

