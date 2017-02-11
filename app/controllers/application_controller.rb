class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :load_gtm
  attr_accessor :containerId

  def index
  end

  def load_gtm
    config = YAML::load_file("config/gtm.yml")
    @containerId = config["containerId"]
  end


end
