class Cart < ApplicationRecord
	has_many :lines, dependent: :destroy

	def add_product(product)
		current_item=lines.find_by(product_id: product.id)
		if current_item
			current_item.quantity += 1
		else
		    current_item=lines.build(product_id: product.id)
		end
		    	
current_item
     end


def total_price
lines.to_a.sum { |item| item.total_price }
end

end
