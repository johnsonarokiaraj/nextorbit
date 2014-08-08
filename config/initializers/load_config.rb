WEATHER = YAML::load_file("#{Rails.root}/config/weather.yml")[Rails.env]
