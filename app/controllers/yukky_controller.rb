class YukkyController < ApplicationController
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

  private
  def yukky_params
    params.require(:yukky).permit(:desc)
  end
end
