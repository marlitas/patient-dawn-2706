class Competition < ApplicationRecord
  has_many :entries
  has_many :teams, through: :entries

  def average_age
    teams.joins(:players).average('players.age').to_f.round(1)
  end
end
