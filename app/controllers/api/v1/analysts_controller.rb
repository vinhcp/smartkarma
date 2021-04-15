module Api
  module V1
    class AnalystsController < ApplicationController
      before_action :find_account, only: %i[show]

      def index
        finder = AccountFinder.new(filter_params).perform
        options = { meta: { pagination: finder.summary } }
        render_success data: AccountSerializer.new(finder.results, options).serializable_hash
      end

      def show
        render_success data: AccountSerializer.new(@account).serializable_hash
      end

      private

      def find_account
        @account = Account.external_insight_provider.find_by!(slug: params[:id])
      end

      def filter_params
        params.permit(:type, :page, :per_page, filters: [])
      end
    end
  end
end
