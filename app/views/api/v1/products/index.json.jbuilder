json.data @products, partial: "product", as: :product
json.out_of_stock @out_of_stock, partial: "product", as: :product
json.new_arrivals @new_arrivals, partial: "product", as: :product
