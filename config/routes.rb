NflSite::Application.routes.draw do
  get "coaches/new"

  root              to: 'initial_pages#home'

  match '/help',    to: 'initial_pages#help'
  match '/about',   to: 'initial_pages#about'
  match '/contact', to: 'initial_pages#contact'

  match '/signup',  to: 'coaches#new'

end
