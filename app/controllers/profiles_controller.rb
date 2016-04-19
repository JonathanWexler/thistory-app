class ProfilesController < ApplicationController
	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.update_attributes(user_id: current_user)
		@profile.save
		redirect_to profile_path(@profile)
	end

	def show
		@profile = Profile.find(params[:id])
		redirect_to profile_path(@profile)
	end

	def edit
		@profile = Profile.find(params[:id])
		redirect_to edit_profile_path(@profile)
	end

	def update
		@profile = Profile.find(params[:id])
		@profile.update_attributes(profile_params)
		@profile.save
		redirect_to profile_path(@profile)
	end

	private 

	def profile_params
		params.require(:profile).permit(:first_name, :last_name, 
																		:bio, :age_range, :expertise,
																		:neighborhood)
	end
end