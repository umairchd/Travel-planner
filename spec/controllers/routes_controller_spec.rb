require 'rails_helper'

RSpec.describe RoutesController, type: :controller do

  context 'should verify the actions for routes controller' do

    let!(:user) { User.create(name: 'test user', email: 'test@email.com') }

    let!(:home) { Location.create(address: 'Lahore', category: 'home', user_id: user.id) }

    let!(:work) { Location.create(address: 'Kasur', category: 'work', user_id: user.id) }

    describe '#index' do
      it 'should get index page results' do
        get :index, params: { user_id: user.id }

        expect(response.status).to eql 200
        expect(response).to have_http_status(:ok)
      end
    end

  end
end