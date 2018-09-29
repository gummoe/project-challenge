require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe '#index' do
    it 'displays recent dogs' do
      2.times { create(:dog) }
      get :index
      expect(assigns(:dogs).size).to eq(2)
    end
  end

  describe '#create' do
    let(:dog_name) { 'Pickle' }
    let(:response_body) { JSON.parse(response.body) }
    context 'params are valid' do
      let(:request_params) do
        {
          dog: {
            name: dog_name,
            description: 'Pickle loves toys and hates noise',
          }
        }
      end

      subject { post :create, params: request_params }

      it 'creates a new dog' do
        subject

        new_dog = Dog.find_by name: dog_name
        expect(new_dog).to be_present
        expect(response).to have_http_status(302)
      end
    end
  end
end
