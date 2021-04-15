require 'rails_helper'

RSpec.describe Account do
  describe 'associations' do
    it { should belong_to(:insight_provider) }
  end
end
