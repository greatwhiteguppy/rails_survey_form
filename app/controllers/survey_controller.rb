class SurveyController < ApplicationController
  def index
     @users = User.all
     session[:views] ||= 0
  end

  def create
      @user = User.new(user_params)
      if @user.valid?
          @user.save
          session[:views] = session[:views] + 1
          flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:views] } time(s) now."
          session[:answer] = params[:user]
          redirect_to "/result"
      else
          flash[:errors] = @user.errors.full_messages
          redirect_to "/"
      end
  end

  def show
      @answer = session[:answer]
  end

  private
    def user_params
        params.require(:user).permit(:name, :location, :language, :comment)
    end
end
