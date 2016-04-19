class ProfilesController < ApplicationController
	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	private 

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, 
																		:bio, :age_range, :expertise,
																		:neighborhood)
	end
end