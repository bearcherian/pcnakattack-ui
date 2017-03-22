require 'all_items'

class AllItemsController < ApplicationController

  def show
    items = AllItems.new

    if (params.has_key?(:maxTime) && !params[:maxTime].empty?)
      maxTime = params[:maxTime].to_time
    else
      maxTime = Time.new
    end

    logger.info("Max time: #{maxTime}")
    render json:items.getLatestItems(maxTime)
  end
end
