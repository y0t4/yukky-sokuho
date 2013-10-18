class YukkyController < ApplicationController
  before_action :set_yukky , only: :update

  def index
    @new_data = Yukky.new
    @yukky = Yukky.all
  end

  def add
    @new_data = Yukky.new(yukky_params)

    respond_to do |format|
      if @new_data.save
        format.html { redirect_to :action => 'index' }
      end
    end
  end

  def update
    update_param = { "label" => params["label"] }

    if @yukky.update(update_param)
      respond_to do |format|
        format.json { render :nothing => true }
      end
    end
  end

  private
  def set_yukky
    @yukky = Yukky.find(params[:id])
  end

  def yukky_params
    params.require(:yukky).permit(:desc)
  end
end
