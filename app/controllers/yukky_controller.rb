class YukkyController < ApplicationController
  def index
    @json = YukkyHelper::JsonManager.new("yukky.json")
    @yukky = @json.get_all
  end

  def add
    now = Time.now.strftime("%Y/%m/%d %H:%M:%S") 
    @new_data = { 'time' => now, 'desc' => params['desc'] }

    @yukky = YukkyHelper::JsonManager.new("yukky.json")
    @yukky.add @new_data
    @yukky.save

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end
end
