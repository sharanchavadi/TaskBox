class Api::V1::ApiController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    
	def authenticate_api!
		if params[:key]
			@user = User.find_by(api_key: params[:key])
			if @user.nil?
				render 'api/v1/errors/invalid_key.json.rabl'
			else
				return @user
			end
		else
			render 'api/v1/errors/api_error.json.rabl'
		end
	end

end
