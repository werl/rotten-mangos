class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to movie_path, notice: "Welcome back, #{@user.firstname}!"
    else
      flash.now[:alert] = 'login failed...'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to movies_path, notice: 'Adios!'
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
