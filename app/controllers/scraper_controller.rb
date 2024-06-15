class ScraperController < ApplicationController


  def scrap
    items_data = JSON.parse(request.body.read, symbolize_names: true)
    Rails.logger.info "Données reçues pour le scraping : #{items_data.inspect}"
    time = Time.now
    items_data.flatten.each do |item_data|
      append_or_create(item_data, time).save
    end
    render json: { message: 'Seed successful' }, status: :ok
  rescue JSON::ParserError => e
    render_json_parsing_error(e)
  end

  private

  def append_or_create(item_data, time)
    item = Item.find_or_initialize_by(name: item_data[:name])
    if item.persisted?
      append_scrap(item, item_data, time)
    else
      item = create_item(item_data, time)
    end
    item
  end

  def render_json_parsing_error(error)
    Rails.logger.error "Erreur de parsing JSON: #{error.message}"
    render json: { error: 'Invalid JSON', details: error.message }, status: :unprocessable_entity
  end

  def append_scrap(item, item_data, time)
    item.unit_price << item_data[:unit_price].to_i
    item.tenth_price << item_data[:ten_price].to_i
    item.hundred_price << item_data[:hundred_price].to_i
    item.scrap_date << time
    item
  end

  def create_item(item_data, time)
    Item.new(
      name: item_data[:name],
      unit_price: [item_data[:unit_price].to_i],
      tenth_price: [item_data[:ten_price].to_i],
      hundred_price: [item_data[:hundred_price].to_i],
      scrap_date: [time],
      img_url: item_data[:img_url],
      ressource_type: item_data[:item_type],
      f_xp: 0.0, xp_quantity: 0, must_buy: false
    )
  end
end
