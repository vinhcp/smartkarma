module Api
  module V1
    class FiltersController < ApplicationController
      def index
        insight_providers = InsightProvider.all
        keys = AccountFinder::EXPERTISE_FILTERS
        data = insight_providers.map { |ip| ip.areas_of_expertise.slice(*keys).values }
                                .uniq.flatten.reject(&:blank?)
        render_success data: data
      end
    end
  end
end
