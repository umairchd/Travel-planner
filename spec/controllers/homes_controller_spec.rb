require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  context 'should verify the actions for homes controller' do

    describe '#index' do
      it 'should get index page results' do
        get :index

        expect(response.status).to eql 200
        expect(response).to have_http_status(:ok)
      end
    end

  end
end