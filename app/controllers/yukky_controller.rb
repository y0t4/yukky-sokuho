class YukkyController < ApplicationController
  def index
    #@yukky = Yukky.paginate(:page => params[:page])
    #@yukky = Yukky.all
    json = YukkyHelper::JsonManager.new("yukky.json")
    @yukky = json.get_all
  end

  def add

    json = YukkyHelper::JsonManager.new("yukky.json")
    now = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    new_data = { 'time' => now, 'desc' => params['desc'] }

    id = json.get_all.length
    new_data.store("id", id)
    json.add new_data
    json.save

    #tmp = Yukky.new
    #time = Time.now.strftime("%Y/%m/%d %H:%M:%S")
    #desc = params['desc']
    #tmp.id = 100
    #tmp.attributes = {:time => time, :desc => desc, :user => "yukky_sokuho" }
    #tmp.attributes.save

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end
end
