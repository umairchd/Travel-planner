require 'rails_helper'

RSpec.describe Route, type: :model do

  describe 'Route Associations' do

    it { should belong_to(:user) }

  end

end