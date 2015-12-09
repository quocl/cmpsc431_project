class UserController < ApplicationController
	before_action :authenticate_user!
	def profile
		@user = current_user
		@categories = Category.all
		@sale_items = SaleItem.all
	end

	def upgrade
		@user = current_user
		@user.usergroup = 2
		@user.save
		respond_to do |format|
	      format.html { redirect_to profile_url, notice: 'Your have successfully upgraded. $500 will be charged annually.' }
	      format.json { head :no_content }
	    end
    end

    def cancel
		@user = current_user
		@user.usergroup = 1
		@user.save
		respond_to do |format|
	      format.html { redirect_to profile_url, notice: 'Your have successfully cancelled. $500 is non-refuncable.' }
	      format.json { head :no_content }
    	end
	end
end
