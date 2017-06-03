Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/flipjs'
  get 'static_pages/fliprails'

  get 'static_pages/randomizer'

  root 'application#hello'
end
