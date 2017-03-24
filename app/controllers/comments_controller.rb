class CommentsController < ApplicationController

  def index
    @information = Information.find(params[:information_id])
    @comments = @information.comments
  end



end
