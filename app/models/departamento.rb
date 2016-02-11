class Departamento < ActiveRecord::Base
	validates :nome, presence: true, length: {minimum: 5}
end
