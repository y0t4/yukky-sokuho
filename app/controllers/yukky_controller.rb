class YukkyController < ApplicationController
  def index
  end

  def add
    now = Time.now.strftime("%Y/%m/%d %H:%M:%S") 
    @yukky = { tim: now, desc: params['desc'] }
    respond_to do |format|
      format.html { render 'yukky/index' }
      format.json { render :json => @yukky }
    end
  end
end
