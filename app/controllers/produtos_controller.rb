class ProdutosController < ApplicationController

	def index
		# O arroba torna a variável acessível na view
		@produtos = Produto.order(:nome).limit(10)
	end

	def create
		valores = params.require(:produto).permit(:nome, :preco, :descricao, :quantidade)
		produto = Produto.create(valores)
		flash[:success] = "Produto criado com sucesso!"
		redirect_to produtos_url
	end

	def destroy
		id = params["id"]
		Produto.destroy(id)
		flash[:danger] = "Produto removido com sucesso!"
		redirect_to produtos_url
	end

end
