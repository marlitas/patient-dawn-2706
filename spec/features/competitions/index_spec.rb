require 'rails_helper'

RSpec.describe 'Competition Index' do
  describe 'user' do
    before(:each) do
      @competition1 = Competition.create!(name: 'Big Bowl', location: 'Atlanta', sport: 'Soccer')
      @competition2 = Competition.create!(name: 'Big Trophy', location: 'Alberta', sport: 'Tennis')
    end

    it 'displays competitions' do
      visit "/competitions"

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition2.name)
    end

    it 'links each competition to their show page' do
      visit "/competitions"

      click_on(@competition1.name)

      expect(current_path).to eq("/competitions/#{@competition1.id}")
    end


  end
end
