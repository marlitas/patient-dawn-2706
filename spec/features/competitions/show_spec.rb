require 'rails_helper'

RSpec.describe 'Competition Show' do
  before(:each) do
    @competition1 = Competition.create!(name: 'Big Bowl', location: 'Atlanta', sport: 'Soccer')
    @competition2 = Competition.create!(name: 'Big Trophy', location: 'Alberta', sport: 'Tennis')
  end

  describe 'user' do
    it 'displays a competitions attributes' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)

      expect(page).to_not have_content(@competition2.name)
    end
  end
end
