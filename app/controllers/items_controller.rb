class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items[0..1500]
  end
end
