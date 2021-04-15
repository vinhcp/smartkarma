require 'rails_helper'

RSpec.describe Api::V1::AnalystsController, type: :controller do
  let(:insight_provider) { create(:insight_provider) }

  describe 'GET #index' do
    context 'have external insight accounts' do
      it 'return http success & popular data' do
        create(:insight_provider_point, insight_provider: insight_provider)
        create(:account,
               name: 'Account 1',
               is_insight_provider: true,
               insight_provider_type: 'external',
               insight_provider: insight_provider)
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to have_key('data')
        expect(response.body).to include('Account 1')
        expect(JSON.parse(response.body)['data'].count).to eq(1)
      end
    end

    context 'have no external insight accounts' do
      it 'return http success & empty data' do
        create(:insight_provider_point, insight_provider: insight_provider)
        create(:account,
               name: 'Account 2',
               is_insight_provider: false,
               insight_provider_type: 'external',
               insight_provider: insight_provider)
        get :index
        expect(response.status).to eq(200)
        expect(JSON.parse(response.body)).to_not have_key('data')
        expect(response.body).to_not include('Account 2')
      end
    end
  end

  describe 'GET #show' do
    context 'have external insight accounts' do
      it 'return http success & popular data' do
        create(:insight_provider_point, insight_provider: insight_provider)
        create(:account,
               name: 'Account 3',
               slug: 'account-3',
               is_insight_provider: true,
               insight_provider_type: 'external',
               insight_provider: insight_provider)
        get :show, params: { id: 'account-3' }
        expect(response.status).to eq(200)
        expect(response.body).to include('Account 3')
        expect(JSON.parse(response.body)).to have_key('data')
      end
    end

    context 'have no external insight accounts' do
      it 'return http success & empty data' do
        create(:insight_provider_point, insight_provider: insight_provider)
        create(:account,
               name: 'Account 4',
               slug: 'account-4',
               is_insight_provider: false,
               insight_provider_type: 'external',
               insight_provider: insight_provider)
        get :show, params: { id: 'account-4' }
        expect(response.status).to eq(404)
        expect(JSON.parse(response.body)).to_not have_key('data')
        expect(JSON.parse(response.body)).to have_key('message')
        expect(response.body).to include("Couldn't find Account")
      end
    end
  end
end
