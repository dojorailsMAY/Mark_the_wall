class UsersController < ApplicationController

def index
end

def login
  user = User.find_by_email(params[:email])
  if params[:password] == user.password
    session[:user_name] = user.name
    session[:user_id] = user.id
    redirect_to '/home'
  else
    flash[:notice] = "User not found"
    redirect_to '/home'
  end
end

def logout
  reset_session
  redirect_to '/login'
end

def register
  @user = User.new(register_params)
  if !@user.save  # Check user validations before setting session
    flash[:notice] = @user.errors.full_messages
  else
    session[:user_name] = @user.name
    session[:user_id] = @user.id
  end
  redirect_to '/home'
end



private
  def register_params
    params.require(:user).permit(:name, :email, :password)
  end



end
