class Order < ApplicationRecord
	has_many :lines , dependent: :destroy

enum pay_type: {
	"Check" => 0,
	"Credit card" => 1,
	"Purchase order" =>2
}

validates :name, :address, :email, presence: true
validates :pay_type, inclusion: pay_types.keys


def add_lines_from_cart(cart)
	cart.lines.each do |item|
		item.cart_id=nil
		lines << item
	end
end	

end

