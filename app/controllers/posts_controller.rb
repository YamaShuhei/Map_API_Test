class PostsController < ApplicationController
  
  def index
    @all_post_position = Post.all.pluck(:latitude, :longitude).to_json
  end
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
    @all_post_position = Post.all.pluck(:latitude, :longitude).to_json
  end

  def create
    @result = MapQuery.new(params[:post]).result
    
    @post = Post.new(
      title: post_params["title"],
      address: post_params["address"],
      latitude: @result["lat"],
      longitude: @result["lng"]
      )
    if @post.save
      flash[:notice] = "保存しました"
      redirect_to posts_path
    else
      flash.now[:danger] = "保存に失敗しました"
      render action: :new
    end
  end
  
    private
  
  def post_params
    params.require(:post).permit(:title,:address, :latitude, :longitude)
    
  end
end
