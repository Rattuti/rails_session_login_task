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
            redirect_to tasks_path, flash: {success: 'アカウントを登録しました'}
        else
            render :new
        end
    end

    def show
        @user = user.find(params[:id])
    end

    def edit
        @user = user.find(params[:id])
    end

    def update
        @user = user.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(current_user.id), flash: {success: 'アカウントを更新しました'}
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to new_session_path
    end


    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def current_user

    end    
end