class PostsController < ApplicationController
   before_action :find_post, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :show]
  def index
     @post = Post.all.order("created_at DESC")
  end

  def new
     @post = current_user.post.build
  end

  def create
     @post = current_user.post.build(post_params)


     respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end

  end
end

  def show

  end

  def edit

 end

 def update


    if @post.update(post_params[:post].permit(:group, :goal))
      redirect_to @post
   else
      render 'edit'
   end
end

def destroy
   
end
  private

  def find_post
     @post = Post.find(params[:id])
  end



  def post_params
     params.require(:post).permit(:group, :goal)
  end

end

