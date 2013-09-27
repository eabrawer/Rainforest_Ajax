class Product < ActiveRecord::Base
	validates :description, :name, :presence => true
	validates :price_in_cents, :numericality => {:only_integer => true}

  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

	# or

	# def price
	# 	dollar_value = self.price_in_cents.to_f / 100
	# 	dollar_value.to_s(:currency, precision 3)
	# end

	# or

	# (self.price_in_cents.to_f / 100).to_s(:currency, precision 3)

	has_many :reviews
	has_many :users, :through => :reviews

end
