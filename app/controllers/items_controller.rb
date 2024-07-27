class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def worth
    # récupérer les items dont le type de ressource appartient à un certain type
    @items = Item.where(ressource_type: RessourceTypes.types)

    #verifier si la mediane est supérieur au cout du dernière item
    newItem = @items.select do |item|
        item.isWorth
    end

    render json: newItem
  end
end


private



