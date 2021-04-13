class Account < ApplicationRecord
  belongs_to :company
  belongs_to :insight_provider
end
