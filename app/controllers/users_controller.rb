class UsersController < ApplicationController

    def index
       @users = User.all 
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = current_user
    end

    def delete_image
        image = ActiveStorage::Attachment.find(params[:image_id])
        if current_user = image.record || current_user.admin?
            image.purge
            #message or jwt that front end will use to redirect after deletion
        else
            #error message and value/jwt that frontend will use to redirect with an error message
        end
    end
end