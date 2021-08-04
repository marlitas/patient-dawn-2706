class Entry < ApplicationRecord
  belongs_to :competition
  belongs_to :team
end
