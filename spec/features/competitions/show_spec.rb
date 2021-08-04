require 'rails_helper'

RSpec.describe 'Competition Show' do
  before(:each) do
    @competition1 = Competition.create!(name: 'Big Bowl', location: 'Atlanta', sport: 'Soccer')
    @competition2 = Competition.create!(name: 'Big Trophy', location: 'Alberta', sport: 'Tennis')

    @team1 = Team.create!(nickname: 'Buzzers', hometown: 'Miami')
    @team2 = Team.create!(nickname: 'Hawks', hometown: 'Chicago')
    @team3 = Team.create!(nickname: 'Mustangs', hometown: 'Cleveland')

    @player1 = @team1.players.create!(name: 'Bob', age: 12)
    @player2 = @team1.players.create!(name: 'Hannah', age: 14)
    @player3 = @team1.players.create!(name: 'Bert', age: 16)
    @player4 = @team2.players.create!(name: 'Lou', age: 13)
    @player5 = @team2.players.create!(name: 'Carrie', age: 15)
    @player6 = @team2.players.create!(name: 'Sam', age: 14)
    @player7 = @team3.players.create!(name: 'Tori', age: 14)

    @competition1.teams << [@team1, @team2]
    @competition2.teams << [@team1, @team3]
  end

  describe 'user' do
    it 'displays a competitions attributes' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)

      expect(page).to_not have_content(@competition2.name)
    end

    it 'displays the nicknames and hometowns of associated teams' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)

      expect(page).to_not have_content(@team3.nickname)
      expect(page).to_not have_content(@team3.hometown)
    end

    it 'displays average age of associated players' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content('Average Age: 14.0')
    end

    it 'links to new team registration' do
      visit "/competitions/#{@competition1.id}"

      click_on('Register Team')

      expect(current_path).to eq('/teams/new')
    end
  end
end
