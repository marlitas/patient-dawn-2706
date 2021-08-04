class Team < ApplicationRecord
  has_many :players
  has_many :entries
  has_many :competitions, through: :entries
end
