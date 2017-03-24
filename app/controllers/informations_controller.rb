class InformationsController < ApplicationController

  def index
    @informations = Information.all
    @information = Information.page(params[:page]).per(5)
  end

  def new
    @information = Information.new
  end

  def create
   @information = Information.new(information_params)
    if @information.save
      redirect_to informations_path
    else
      render :new
    end
  end

  def show
   @information = Information.find(params[:id])
  end

  def edit
   @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to informations_path
    else
      render :edit
    end
  end

  def destroy
   @information = Information.find(params[:id])
   @information.destroy

   redirect_to informations_path
  end


  private

  def information_params
   params.require(:information).permit(:title, :content, :category_id)
  end

end
