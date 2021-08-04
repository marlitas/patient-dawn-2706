require 'rails_helper'

RSpec.describe 'New Team' do
  before(:each) do
    @competition1 = Competition.create!(name: 'Big Bowl', location: 'Atlanta', sport: 'Soccer')

    @team1 = Team.create!(nickname: 'Buzzers', hometown: 'Miami')
    @team2 = Team.create!(nickname: 'Hawks', hometown: 'Chicago')

    @player1 = @team1.players.create!(name: 'Bob', age: 12)
    @player2 = @team1.players.create!(name: 'Hannah', age: 14)
    @player3 = @team1.players.create!(name: 'Bert', age: 16)
    @player4 = @team2.players.create!(name: 'Lou', age: 13)
    @player5 = @team2.players.create!(name: 'Carrie', age: 15)
    @player6 = @team2.players.create!(name: 'Sam', age: 14)

    @competition1.teams << [@team1, @team2]
  end

  describe 'user' do
    it 'can enter a new team to competition' do
      visit "/competitions/#{@competition1.id}/teams/new"

      fill_in(:hometown, with: 'Pheonix')
      fill_in(:nickname, with: 'Hogs')
      click_on('submit')

      expect(current_path).to eq("/competitions/#{@competition1.id}")

      expect(page).to have_content('Pheonix')
      expect(page).to have_content('Hogs')
    end
  end
end
