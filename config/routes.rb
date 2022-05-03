# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'stories#index'
  devise_for :users, skip: :registrations
  authenticate :user do
    get 'stories', to: 'stories#index'
    get 'likedstories', to: 'stories#liked_stories'
    get '/story/:id', to: 'stories#show', as: :story
    post '/like/:id', to: 'stories#like', as: :like
    delete '/like/:id', to: 'stories#unlike', as: :unlike
  end
end
