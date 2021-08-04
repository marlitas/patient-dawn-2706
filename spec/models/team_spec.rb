require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:entries)}
    it { should have_many(:competitions).through(:entries)}
  end
end
