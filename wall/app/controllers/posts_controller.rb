class PostsController < ApplicationController

def create_message
  @message = Message.new(user:User.find(session[:user_id]), content:params[:content])
  @message.save
  redirect_to '/home'
end

def create_comment
  @comment = Comment.new(message:Message.find(params[:message_id]), content:params[:content], user:User.find(session[:user_id]))
  @comment.save
  puts @comment.errors.full_messages
  puts @comment
  redirect_to '/home'
end

def home
  unless(session[:user_name] == nil)
    @messages = Message.order('id DESC')
    @comments = Comment.all
  else
    redirect_to '/login'
  end
end


private
  def message_params
    params.require(:message).permit(:content, :user)
  end


end
