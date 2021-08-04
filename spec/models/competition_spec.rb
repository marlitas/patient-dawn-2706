require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it {should have_many(:entries)}
    it {should have_many(:teams).through(:entries)}
  end

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

  describe 'instance methods' do
    it 'can calculate average age of entered players' do
      expect(@competition1.average_age).to eq(14.0)
    end
  end
end
