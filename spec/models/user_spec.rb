require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'User Associations' do

    it { should have_many(:locations ) }

    it { should have_many(:routes )}

  end


end
