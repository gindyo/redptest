json.array!(@inventory_products) do |inventory_product|
  json.extract! inventory_product, :name, :available_count, :unit_price
  json.url inventory_product_url(inventory_product, format: :json)
end
