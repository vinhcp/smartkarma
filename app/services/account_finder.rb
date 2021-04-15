class AccountFinder
  EXPERTISE_FILTERS = %w[content_vertical_primary content_vertical_secondary]
  attr_accessor :type, :page, :per_page, :filters, :results, :summary

  def initialize(params)
    @type = params[:type] || 'all'
    @page = params[:page]
    @per_page = params[:per_page]
    @filters = params[:filters]
  end

  def perform
    tap do |object|
      object.results = PaginationHandler.paginate(accounts, page, per_page)
      object.summary = PaginationHandler.pagination_summary(results)
    end
  end

  private

  def accounts
    @accounts ||= send(type)
  end

  def trending
    available_accounts.order(total_viewed_external_reports: :desc,
                             total_viewed_insights: :desc)
  end

  def all
    available_accounts.sort_by { |account| account.rank }
  end

  def available_accounts
    scope = Account.external_insight_provider
                   .includes(insight_provider: :insight_provider_point)
                   .joins(insight_provider: :insight_provider_point)
    scope = scope.where(filter_conditions, filters: filters) if filters.present?
    scope
  end

  def filter_conditions
    EXPERTISE_FILTERS.map { |key| "areas_of_expertise->'#{key}' ?| array[:filters]" }
                     .join(' or ')
  end
end
