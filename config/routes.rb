Rails.application.routes.draw do

  root to: 'index#home'

  get 'home', to: 'index#home', as: 'home'

#MODELOS

  #projects

  get 'projects', to: 'project#index', as: 'projectIndex'
  get 'projects/new', to: 'project#new', as: 'projectNew'
  post 'projects', to: 'project#create'
  get 'projects/:id', to: 'project#show', as: 'projectShow'
  get 'projects/:id/edit', to: 'project#edit', as: 'projectEdit'
  patch 'projects/:id/', to: 'project#update', as: 'projectUpdate'
  delete "projects/:id", to: "project#delete", as: 'projectDelete'
  get "projects/:id/expenses", to: "project#expenses", as: 'projectExpenses'
  get "projects/:id/report", to: "project#report", as: 'projectReport'
  get "projects/:id/materials", to: "project#materials", as: 'projectMaterials'
  resources :projects

  #items 

  get 'projects/:id/items/new', to: 'item#new', as: 'itemNew'
  post 'items', to: 'item#create'
  post 'expenses', to: 'item#createExpense'
  get 'items/:itemId', to: 'item#show', as: 'itemShow'
  get 'items/:itemId/edit', to: 'item#edit', as: 'itemEdit'
  patch 'items/:itemId', to: 'item#update', as: 'itemUpdate'
  delete "items/:itemId", to: "item#delete", as: 'itemDelete'
  delete "expenses/:expenseId", to: "item#deleteExpense", as: 'expenseDelete'
  delete "expenses/index/:expenseId", to: "item#deleteExpenseIndex", as: 'expenseDeleteIndex'
  get "items/:itemId/expenses/", to: "item#expense", as: 'itemExpenses'
  
  resources :items


  #materials

  get '/material/new', to: 'material#new', as: 'materialNew'
  post 'materials', to: 'material#create'
  get 'materials', to: 'material#index', as: 'materialIndex'
  patch 'materials/:id/', to: 'material#update', as: 'materialUpdate'
  delete 'materials/:materialId', to: 'material#delete', as: 'materialDelete'
  resources :materials

end
