require "cucumber"
require "rspec"
require "httparty"
require "faker"
require "factory_bot"
require "pry"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_RUN"]}.yaml"))
$base_uri = CONFIG["uri"]