class AdminsController < ApplicationController
	before_action :require_admin



private

	def require_admin
		redirect_to root_url unless current_user.try(:admin)
	end

end
