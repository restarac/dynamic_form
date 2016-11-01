Rails.application.routes.draw do

  resources :form_answers do
    member do
      get 'new_answer'
      post 'save_answer'
    end
  end

  resources :custom_forms, except: [:show] do
    resources :custom_form_fields, except: [:show,:index], path: 'fields', as: 'field'
  end
  
  root 'custom_forms#index'
end
