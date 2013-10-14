class YukkyController < ApplicationController
  def index
    @json = YukkyHelper::JsonManager.new("yukky.json")
    @yukky = @json.get_all
  end

  def add
    json = YukkyHelper::JsonManager.new("yukky.json")
    now = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    new_data = { 'time' => now, 'desc' => params['desc'] }

    id = json.get_all.length
    new_data.store("id", id)
    json.add new_data
    json.save

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end
end
