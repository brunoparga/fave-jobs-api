# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/jobs', to: 'jobs#index'
  post '/jobs', to: 'jobs#create'
  delete '/jobs/:api_id', to: 'jobs#destroy'
end
