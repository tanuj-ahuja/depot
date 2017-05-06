class Line < ApplicationRecord
  belongs_to :order ,optional: true
  belongs_to :product,optional: true
  belongs_to :cart


def total_price
	product.price * quantity
end	

   def  d
   	 if self.quantity==1
     self.destroy
     else
     self.quantity -= 1
     end
     self
    end

end

