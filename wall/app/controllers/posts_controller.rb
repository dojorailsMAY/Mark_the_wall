class PostsController < ApplicationController

def create_message  # Should be posts#create method and comments#create method (2 controllers)
  @message = Message.new(user:User.find(session[:user_id]), content:params[:content])
  @message.save
  # user = User.find(session[:user_id])
  # user.messages.create(content: params[:content])
  # 
  # another way to do it ^
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

    # @messages = Message.order('id DESC').includes(:comments)
    # 
    # (in html)
    # @messages.each do |message|
    #   display message ...
    #   message.comments.each do |comment|
    #     display comment ...
    #   end
    # end
  else
    redirect_to '/login'
  end
end


private
  def message_params
    params.require(:message).permit(:content, :user)
  end


end
