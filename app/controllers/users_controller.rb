class UsersController < ApplicationController

    def index
        @user = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def update
    end

    def destroy
    end


    private

    def user_params
        params(:user).permit(:name, :email, password, :password_confirmation)
    end
end