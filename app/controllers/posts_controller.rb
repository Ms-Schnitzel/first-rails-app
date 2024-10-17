class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_post = Post.create(content: params[:content], user_id: params[:user])

    render json: { content: new_post }
  end


  def display
    posts = Post.all.map{ |item| [item.user_id, item.content] }

    render json: { content: posts }
  end


  def edit
    post = Post.find_by(id: params[:id])
    post.update(content: params[:content]) 
    render json: { content: post }
  end
  

  def remove
    post = Post.find_by(id: params[:id])
    post.destroy
    # render json: {content: Post.all.to_json}
  end


end
