Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      extend ApiV1Routes
    end
  end
end
