class CommentsController < ApplicationController
  def create
    update = Update.find_by(id: params[:update_id])
      @comment = update.comments.build(content: params[:comment].require(:content), user: current_user)
      if @comment.save
        flash[:success] = "Comment saved" 
      else
        flash[:error] = "error"
      end	
      @previous_updates = current_user.updates
      respond_to do |format|
        format.html { redirect_to associate_path }
        format.js
      end
    end
    
  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.delete
    @previous_updates = current_user.updates
    @comment = current_user.comments.build
    respond_to do |format|
      format.html { redirect_to associate_path }
      format.js
    end
  end
end