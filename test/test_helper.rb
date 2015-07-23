require 'minitest/autorun'

def daily_fixture
  File.read(File.expand_path('../fixtures/today.json', __FILE__))
end

def five_days_fixture
  File.read(File.expand_path('../fixtures/5.days.json', __FILE__))
end

def sixteen_days_fixture
  File.read(File.expand_path('../fixtures/16.days.json', __FILE__))
end
