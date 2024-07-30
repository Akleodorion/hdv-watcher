class ItemsController < ApplicationController
  include ArrayUtils
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

  def paginateditem
    @items = Item.where(ressource_type: RessourceTypes.types)
    newItem = @items.select do |item|
      item.price_type_is_worth(paginated_items_params[:price_type])
    end
    splitted_array = split_array_into_batches(newItem,100)
    number_of_batches = calculate_number_of_batches(newItem, 100)
    response = {"items": splitted_array[paginated_items_params[:batch_index].to_i], "batches": number_of_batches}
    render json: response
  end
end


private

def paginated_items_params
  params.permit(:batch_index, :price_type)
end



