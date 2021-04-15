module ApiV1Routes
  def self.extended(router)
    router.instance_exec do
      resources :analysts, only: %i[index show]
      resources :filters, only: %i[index]
    end
  end
end
