class ItemsController < ApplicationController
  include ArrayUtils
  def index
    @items = Item.all
    @items = @items.limit(100)
    @items = @items.offset(100 * params[:batch_index].to_i)
    render json: @items
  end

  def scrap_info
    batch_count = (Item.all.count.to_f / 100).ceil
    render json: {
      batch_count:
    }
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
    sorted_array = sort_by_median(newItem,paginated_items_params[:price_type])
    splitted_array = split_array_into_batches(sorted_array,100)
    number_of_batches = calculate_number_of_batches(sorted_array, 100)
    response = {"items": splitted_array[paginated_items_params[:batch_index].to_i], "batches": number_of_batches}
    print(response)
    render json: response
  end
end


private

def paginated_items_params
  params.permit(:batch_index, :price_type)
end



