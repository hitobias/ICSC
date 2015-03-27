class GroupsController < ApplicationController
	def new
	end

	def create
	end

	def destroy
		@group = Group.find(params[:id])
		@group.destroy

		respond_to do |format|
			format.html { redirect_to members_path}
			format.js
		end
	end
end
