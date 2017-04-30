class Cart < ApplicationRecord
	has_many :lines, dependent: :destroy
end
