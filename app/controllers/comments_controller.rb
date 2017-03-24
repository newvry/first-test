class CommentsController < ApplicationController

  before_action :information_set

  def index
    @comments = @information.comments
  end

  def new
    @comment = @information.comments.new
  end

  def create
    @comment = @information.comments.new(comment_params)
    if @comment.save
      redirect_to information_comments_path(@information)
    else
      render :new
    end
  end

  def edit
    @comment = @information.comments.find(params[:id])
  end

  def update
    @comment = @information.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to information_comments_path(@information)
    else
      render :edit
    end
  end

  def destroy
    #byebug
    @comment = @information.comments.find(params[:id])
    @comment.destroy
    redirect_to information_comments_path(@information)
  end

  private

  def information_set
    @information = Information.find(params[:information_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end


end
