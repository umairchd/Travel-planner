require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  context 'should verify the actions for locations controller' do

    let!(:user) { User.create(name: 'test user', email: 'test@email.com') }

    describe '#index' do
      it 'should get index page results' do
        get :index, params: { user_id: user.id }

        expect(response.status).to eql 200
        expect(response).to have_http_status(:ok)
      end
    end

    describe '#create' do
      it 'should create locations' do
        post :create, params: { user_id: user.id, category: "home" }

        expect(response.status).to eql 200
        expect(response).to have_http_status(:ok)
      end

      it 'should check the database entries count for location creation' do
        expect do
          post :create, params: { user_id: user.id, category: "home" }

          expect(response.status).to eql 200
          expect(response).to have_http_status(:ok)
        end.to change(Location, :count).by(1)
      end

      it 'should check the database entries count for location creation to not change for invalid-category' do
        expect do
          post :create, params: { user_id: user.id, category: "invalid-category" }
        end.to change(Location, :count).by(0)
      end

    end

    describe '#calculate_routes' do
      let!(:home) { Location.create(address: 'Lahore', category: 'home', user_id: user.id) }

      let!(:work) { Location.create(address: 'Kasur', category: 'work', user_id: user.id) }

      it 'should calculate routes' do
        get :calculate_routes, params: { user_id: user.id }

        expect(response.status).to eql 200
        expect(response).to have_http_status(:ok)
      end
    end
  end
end