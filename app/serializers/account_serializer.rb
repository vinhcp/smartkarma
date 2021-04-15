class AccountSerializer
  include JSONAPI::Serializer
  attributes :slug, :rank, :name, :headline, :description, :country,
             :experience, :linked_in, :twitter, :website

  attribute :year_of_experience do |_|
    (1..20).to_a.sample
  end

  attribute :joined_date do |object|
    I18n.l(object.created_at.to_date)
  end

  attribute :areas_of_expertise do |object|
    object.insight_provider.areas_of_expertise
  end

  attribute :total_published_insights do |object|
    object.insight_provider.insight_provider_point.total_published_insights
  end

  attribute :total_viewed_insights do |object|
    object.insight_provider.insight_provider_point.total_viewed_insights
  end

  attribute :total_followers do |object|
    object.insight_provider.insight_provider_point.total_followers
  end

  attribute :insights do |_|
    expertises = %w[Credit Cross\ Asset\ Strategy Cross\ Asset\ Strategy ESG
                    Equity\ Bottom-Up Forensic\ Accounting Equity\ Bottom-Up
                    Equity\ Capital\ Markets Equity\ Capital\ Markets
                    Thematic\ (Sector/Industry)]
    10.times.map do
      {
        expertise: expertises.sample,
        time:  I18n.l(Faker::Time.backward(days: 90, period: :morning)),
        title: Faker::Job.title
      }
    end
  end

  attribute :discussions do |_|
    10.times.map do
      {
        name: Faker::TvShows::Community.characters,
        message: Faker::TvShows::Community.quotes
      }
    end
  end
end
