class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :load_gtm, :load_tags
  attr_accessor :containerId, :tags

  def index
  end

  def load_gtm
    config = YAML::load_file("config/gtm.yml")
    @containerId = config["containerId"]
  end

  def load_tags
    config = YAML::load_file("config/tags.yml")
    @tags = config["tags"]
  end


end
