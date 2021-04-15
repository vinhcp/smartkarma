require 'rails_helper'

RSpec.describe Account do
  describe 'associations' do
    it { should belong_to(:insight_provider) }
    it { should belong_to(:company) }
  end

  it 'has external insight provider scope' do
    sql = Account.where(is_insight_provider: true,
                        insight_provider_type: 'external').to_sql
    expect(Account.external_insight_provider.to_sql).to eq sql
  end
end
