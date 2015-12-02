class UserController < ApplicationController
	before_action :authenticate_user!
	def profile
		@user = current_user
		@categories = Category.all
		@sale_items = SaleItem.all
	end
end
