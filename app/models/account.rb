class Account < ApplicationRecord
  RANKS = %w[2nd\ Quartile Top\ Quartile 3rd\ Quartile Bottom\ Quartile Top\ 5%]
  attr_accessor :rank

  belongs_to :company
  belongs_to :insight_provider

  scope :external_insight_provider, -> { where(is_insight_provider: true, insight_provider_type: 'external') }

  after_initialize do
    self.rank = RANKS.sample
  end
end
