require 'rails_helper'

RSpec.describe InsightProvider do
  describe 'associations' do
    it { should have_one(:insight_provider_point) }
    it { should have_one(:account) }
  end
end
