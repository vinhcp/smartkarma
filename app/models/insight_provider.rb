class InsightProvider < ApplicationRecord
  has_one :account
  has_one :insight_provider_point
end
