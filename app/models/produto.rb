class Produto < ActiveRecord::Base

	validates :quantidade, presence: true
	validates :nome, presence: true, length: {minimum: 5}
	validates :preco, presence: true
	validates :descricao, presence: true, length: {minimum: 20}

end
