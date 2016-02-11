class ProdutosController < ApplicationController
	before_action :set_produto, only: [:show, :edit, :update, :destroy]

	def index
		# O arroba torna a variável acessível na view
		@produtos = Produto.order(:nome).limit(10)
	end

	def new
		@produto = Produto.new
	end

	def create
		valores = params.require(:produto).permit(:nome, :preco, :descricao, :quantidade)
		@produto = Produto.new valores
		if @produto.save
			flash[:success] = "Produto criado com sucesso!"
			redirect_to root_url
		else
			render :new
		end
	end

	def destroy
		id = params["id"]
		Produto.destroy(id)
		flash[:danger] = "Produto removido com sucesso!"
		redirect_to produtos_url
	end

	def busca
		@nomeABuscar = params[:nome]
		@produtos = Produto.where("nome like ?", "%#{@nomeABuscar}%")
	end

	def edit
		@produto = Produto.find(params[:id])
		puts "Alguma coisa #{@produto.nome}"
	end

	def update
		if @produto.update(produto_params)
	      flash[:success] = "Produto alterado com sucesso!"
	      redirect_to produtos_url
	    else
	      render :edit
	    end
	end

	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_produto
	      @produto = Produto.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def produto_params
	      params.require(:produto).permit(:nome, :preco, :descricao, :quantidade)
	    end

end
