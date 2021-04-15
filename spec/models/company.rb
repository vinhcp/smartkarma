require 'rails_helper'

RSpec.describe Company do
  describe 'associations' do
    it { should have_many(:accounts) }
  end
end
