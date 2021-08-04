class Competition < ApplicationRecord
  has_many :entries
  has_many :teams, through: :entries
end
