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
    if @yukky.update(yukky_params)
      @entry = {id: params[:id], label: params[:yukky][:label]}
      respond_to do |format|
      #format.json { render  :text=> params['id'], :text=> params['label'] }
      format.json { render :json=>  @entry }
      end
    end
  end

  private
  def set_yukky
    @yukky = Yukky.find(params[:id])
  end

  def yukky_params
    params.require(:yukky).permit(:desc,:label)
  end
end
