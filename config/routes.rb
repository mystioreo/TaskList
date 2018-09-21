Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks

  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete'
  patch '/tasks/:id/undo_mark_complete', to: 'tasks#undo_mark_complete', as: 'undo_mark_complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
