class UsersController < ApplicationController
    def create
        user = User.create(
            name: params[:userName],
            net_id: params[:userNetID],
            permissions: params[:userPermissions])
        redirect_to(manageusers_url)
    end 
end
