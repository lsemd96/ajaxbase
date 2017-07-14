class HomeController < ApplicationController
  def index
    
    @every_post = Post.all
    
  end
  
  def write
    post = Post.new( title: params[:title], content: params[:content])
    post.save
    redirect_to "/home/index"
    
  end


  def update
    @one_post = Post.find(params[:id])
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to '/home/index'

  end
  
  def update_act
    @one_post = Post.find(params[:id])
    @one_post.title = params[:head]
    @one_post.content = params[:body]
    @one_post.save
    
    redirect_to '/home/index'
  end
  
  
  def reply_write
    reply = Reply.new(content: params[:comment],post_id: params[:postid])
    reply.save
    
    redirect_to :back #없어도될 듯 
    
  end
  
  def reply_destroy
    @one_reply = Reply.find(params[:id])
    @one_reply.destroy
    redirect_to '/home/index'
  end
  
end
