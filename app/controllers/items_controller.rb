class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items[1501..3000]
  end
end
