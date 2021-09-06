class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @post = Post.find(params[:post_id])
  
      respond_to do |format|
        if @like.save
          format.html { redirect_to root_url, notice: "like was successfully created." }
        else
          format.html {  redirect_back fallback_location: root_url, notice: "like failed. Error: #{@like.errors.full_messages}" }
          

        end
      end
  end

  def destroy
  end

  def like_params
    params.permit(:post_id, :user_id)
  end

end
