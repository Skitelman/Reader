Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  root "feeds#index"
  resources :feeds
  resources :entries, only: [:index] do
    collection do
      get 'refresh'
    end
  end
end
