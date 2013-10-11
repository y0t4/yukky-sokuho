module YukkyHelper
  class JsonManager
    PATH = "./tmp/"

    def initialize(name)
      @filename = PATH + name
      @json_data = Array.new

      if File.exist?(@filename) then
        open(@filename,'r') do |fp|
          @json_data = JSON.parse(fp.read)
        end
      end
    end

    def get_all
      return @json_data
    end

    def add(data)
      @json_data.unshift data
    end

    def save
      open(@filename,"w") do |io|
        JSON.dump(@json_data,io)
      end
    end
  end
end
