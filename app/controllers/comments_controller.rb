class CommentsController < ApplicationController
load_and_authorize_resource :post
  load_and_authorize_resource :comment, :through => :post

	def create
    @comment.user = current_user
		if 	@post.save
			redirect_to @post, notice: 'Cambio realizado con exito'
		else
			redirect_to new_user_session_path, alert: 'No hemos podido procesar tu cambio'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	def show

	end





	private

	def create_params
    params.require(:comment).permit(:content)
  end
end
