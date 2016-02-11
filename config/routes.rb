Rails.application.routes.draw do  
  
	root "produtos#index"

	# Produtos
	resources :produtos
	post "/produtos/busca" => "produtos#busca", as: :busca_produto

	# Departamentos
	resources :departamentos
end
