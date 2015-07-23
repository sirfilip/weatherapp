require 'json'
require 'net/http'

module OpenWeatherApi
  class Client

    def initialize(api_key)
      @api_key = api_key
    end

    def today
      Net::HTTP.get(URI("http://api.openweathermap.org/data/2.5/weather?id=785842&key=#{@api_key}&units=metric"))
    end

    def five_days
      Net::HTTP.get(URI("http://api.openweathermap.org/data/2.5/forecast?id=785842&key=#{@api_key}&units=metric"))
    end

    def sixteen_days
      Net::HTTP.get(URI("http://api.openweathermap.org/data/2.5/forecast/daily?id=785842&key=#{@api_key}&units=metric"))
    end

  end

  class DailyWeather
    def initialize(data)
      @data = JSON.parse(data)
    end

    def current_temp
      @data["main"]["temp"]
    end

    def max_temp
      @data["main"]["temp_max"]
    end

    def min_temp
      @data["main"]["temp_min"]
    end
  end

  def self.now
    data = Client.new(ENV['OPEN_WEATHER_API']).today
    result = DailyResult.new(data)
    puts "Current temperature is: #{result.current_temp}"
  end

end


if __FILE__ == $0
  OpenWeatherApi.now
end
