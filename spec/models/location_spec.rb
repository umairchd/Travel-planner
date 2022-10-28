require 'rails_helper'

RSpec.describe Location, type: :model do

  describe 'Route Associations' do

    it { should belong_to(:user) }

    it do
      should define_enum_for(:category).
        with_values([:home,
                     :work])
    end

  end

end