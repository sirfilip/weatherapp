require File.expand_path('../test_helper', __FILE__)
require File.expand_path('../../lib/open_weather_api', __FILE__)

class OpenWeatherApiDailyResultTest < Minitest::Test

  def setup
    @res = OpenWeatherApi::DailyWeather.new(daily_fixture)
  end

  def test_should_return_the_correct_temperature
    assert_equal 28, @res.current_temp, "It fetches the correct current temperature"
  end

  def test_should_return_the_correct_max_temperature
    assert_equal 28, @res.max_temp, "It fetches the correct max temperature"
  end

  def test_should_return_the_correct_min_temperature
    assert_equal 28, @res.min_temp, "It fetches the correct min temperature"
  end

end
