Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/dishes/:id", to: "dish#show"

  get "/chef/:id", to: "chef#show"
  get "/chef/:id/ingredients", to: "chef_ingredients#index"
end
