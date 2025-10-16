Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  get "up", to: ->(_env) { [ 200, { "Content-Type" => "text/plain" }, [ "ok" ] ] }

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  scope "(:locale)", locale: /en|de|at/ do
    resource :session
    resources :passwords, param: :token

    scope module: "pages" do
      get "legal/terms-of-service" => "legal#tos", as: :tos
      get "legal/terms-and-conditions" => "legal#tac", as: :tac
      get "legal/privacy", as: :privacy
      get "legal/imprint", as: :imprint

      get "company/about-us" => "company#about_us", as: :about_us
      get "company/our-work" => "company#our_work", as: :our_work
      get "company/testimonials" => "company#testimonials", as: :testimonials
    end
    get "process" => "pages#processes"

    namespace :website do
      resources :requests, only: :new
    end

    root "pages#homepage"
  end
end
