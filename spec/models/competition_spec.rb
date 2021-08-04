require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it {should have_many(:entries)}
    it {should have_many(:teams).through(:entries)}
  end
end
