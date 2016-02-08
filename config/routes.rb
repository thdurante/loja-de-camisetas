Rails.application.routes.draw do  
	root "produtos#index"

	# Produtos
	resources :produtos
end
