require 'all_items'

class AllItemsController < ApplicationController

  def show
    items = AllItems.new
    render json:items.getLatestItems
  end
end
