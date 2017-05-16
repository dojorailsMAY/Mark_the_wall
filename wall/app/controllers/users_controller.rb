class UsersController < ApplicationController

def index
end

def login
  user = User.find_by(email:params[:email])
  puts user
  puts user.password
  puts "*********************************"
  puts params[:password]
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
  session[:user_name] = @user.name
  puts session[:user_id]
  @user.save
  session[:user_id] = @user.id
  redirect_to '/home'
end



private
  def register_params
    params.require(:user).permit(:name, :email, :password)
  end



end
