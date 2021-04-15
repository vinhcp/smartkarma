require 'rails_helper'

RSpec.describe Api::V1::FiltersController, type: :controller do
  describe 'GET #index' do

    it 'returns http success' do
      insight_provider = create(:insight_provider)
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to include(insight_provider.areas_of_expertise['content_vertical_primary'])
    end
  end
end
